# Tramway::Api

## English Readme

coming soon...

## Russian Readme

Простой в использовании, легко устанавливаемый и плохо кастомизируемый Rails-engine с готовым CRUD через API.

Принцип работы. В приложении заранее указывается для каких моделей создаётся API CRUD. Идея проекта - возможность быстрой выкатки API, с возможностью в последствии избавиться от Tramway API, когда ваш проект становится сложнее.

Гем НЕ манкипатчит стандартные классы и поведение Rails! Именно по этой причине было решено реализовать как Rails-engine, который в последствии можно просто и легко удалить из проекта.

Фичи:

* готовый CRUD для определённых разработчиком моделей
* сохранение истории изменений записей (используется гем `audited`)
* поддержка загрузки файлов (используется `carrierwave`)
* аутентификация пользователя через JWT (используется `knock`)
* поддержка по умолчанию JSON API спецификации (через гем `active_model_serializers`)
* мягкое удаление записей по умолчанию
* поддержка коммуникации по уникальному uid объектов, чтобы не публиковать ID в базе

Ограничения:

* только с ActiveRecord
* только с версией Rails 5.1.* (поддержка 5.2 вскоре будет реализована автором гема, поддержка автором Rails 6 начнётся с версии 6.1. По религиозным автор не использует Rails версий *.0.*
* Ruby >= 2.3
* все модели, которые будут использованы гемом должны наследоваться от `Tramway::ApplicationRecord`
* все модели, которые будут использованы гемом должны иметь атрибут `state`, типа `string` или `text`. Этот атрибут нужен для реализации мягкого удаления. Полное удаление записей из базы не поддерживается
* все модели, которые будут использованы гемом должны иметь атрибут 

Недостатки, которые будут вскоре ликвидированы:

* ядро `tramway` подгружает в себя ненужных для API гемов (недостаток не имеет смысла в случае использования вместе с этим решением гема `tramway-admin`):
  * bootstrap
  * font_awesome5_rails
  * haml
* требуется ручное добавление требуемых для работы гемов
  ```ruby
  gem 'active_model_serializers', '0.10.5'
  gem 'tramway'
  gem 'knock'
  gem 'audited'
  gem 'ransack'
  ```

## Usage

```
rails new tramway_api_sample
```

*Gemfile*

```ruby
gem 'tramway-api', '>= 1.1.0.1'
gem 'active_model_serializers', '0.10.5'
gem 'tramway'
gem 'state_machine', github: 'seuros/state_machine'
gem 'knock'
```

Run `bundle install`

### Initialize @application object

[How-to](https://github.com/Purple-Magic/tramway/blob/develop/README.md#every-tramway-application-need-initialized-application-object-or-if-you-create-tramway-plugin-it-should-be-application_engine-object)

*config/routes.rb*

```ruby
Rails.application.routes.draw do
  # ...
  mount Tramway::Api::Engine, at: '/api'
  # ...
end
```

Then generate User (you use another name, it's just an example) model

```
rails g model user email:text password_digest:text username:text state:text uuid:uuid
```

Enable extension in your database:

*db/migrate/enable_extension.rb*
```ruby
class EnableExtensionUUIDOSSP < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp'
  end
end
```

### You can choose a method, which will be using as public ID method

By default, it's a `uuid` method

To choose your own public ID method, just add this line to:

*config/initializers/tramway.rb*

```ruby
Tramway::Api.id_methods_of(User => { default: :id })
```
If you want to use `uuid` by default, please, add it to your models

### Also, you can add array of secondary methods as IDs, but you'll need to add their names to a request

```ruby
Tramway::Api.id_methods_of(User => { default: id, other: :email }
```

in this case your request will look like this `/api/v1/records/someEmail@mail.com?model=User&key=email`

#### Add generating uuid by default to every model, that is accessible by API

*db/migrate/add_uuid_to_some_model.rb*

```ruby
t.uuid :uuid, default: 'uuid_generate_v4()'
```

*app/models/user.rb*

```ruby
class User < Tramway::ApplicationRecord
  has_secure_password
  
  def self.from_token_payload(payload)
    find_by uuid: payload['sub']
  end
end
```

#### Create file `config/initializers/tramway.rb`
#### If you need JWT authentication add this line to the `config/initializers/tramway.rb`

```ruby
::Tramway::Api.auth_config = { user_model: User, auth_attributes: %i[email username] }
```

#### Configurate available models. Tramway will create end points according to this config

```ruby
::Tramway::Api.set_available_models({
  User => [
    {
      show: lambda do |record, current_user|
        record.id == current_user.id         # shows only current_user profile
      end
    }
  ],
  project: :your_project_name
})
```

Run `rails g tramway:install`

Run `rails db:create db:migrate`

*config/routes.rb*

```ruby
Rails.application.routes.draw do
  mount Tramway::Api::Engine, at: '/api'
end
```

Create file *app/forms/user_sign_up_form.rb*

```ruby
class UserSignUpForm < Tramway::ApplicationForm
  properties :username, :email, :password
end
```

**DONE!**

## Testing

# Preparation (optional)

Let's write RSpec test to check what we have:

*Gemfile*

```ruby
group :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'rspec-json_expectations', '2.2.0'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'json_matchers'
  gem 'json_api_test_helpers', '1.1.1'
end
```

Run `bundle install`

Run `RAILS_ENV=test rails db:create db:migrate`

Run `mkdir spec`

Create file `spec/spec_helper.rb` with:

```ruby
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rspec/rails'
require 'rspec/autorun'
require 'rspec/expectations'
require 'rspec/json_expectations'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
```

Create file `spec/rails_helper.rb` with:

```ruby
require 'spec_helper'
require 'factory_bot'
require 'rspec/rails'
require 'rspec/json_expectations'
require 'json_matchers/rspec'
require 'json_api_test_helpers'
require 'rake'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
  config.include RSpec::Rails::RequestExampleGroup, type: :feature
  config.include JsonApiTestHelpers
end
```

# SignUp user

Create file `spec/tramway_api_spec.rb` with:

```ruby
require 'rails_helper'

RSpec.describe 'Post creating user', type: :feature do
  describe 'POST /api/v1/user with model User' do
    let(:attributes) do
      kebab_case_converter attributes_for :user
    end

    it 'returns created status' do
      post '/api/v1/user', params: { user: attributes }
      expect(response[:status]).to eq 201
    end
    
    it 'returns no errors' do
      post '/api/v1/user', params: { user: attributes }

      expect(json_response[:response]). to be_nil
    end
  end
end
```

# SignIn User

```ruby
require 'rails_helper'

RSpec.describe 'Post generate token', type: :feature do
  describe 'POST /api/v1/user_tokens' do
    let(:user) { create :user, password: '123456789' }

    it 'returns created status' do
      post '/api/v1/user_tokens', params: { auth: { login: user.email, password: '123456789' }  }

      expect(response[:status]).to eq 201
    end
    
    it 'returns token' do
      post '/api/v1/user_tokens', params: { auth: { login: user.email, password: '123456789' }  }

      expect(json_response[:auth_token].present?).to be_truthy
      expect(json_response[:user]).to include_json({ email: user.email, uuid: user.uuid })
    end

  end
end
```

Run `rspec` to test

We have route `user`, which create new authenticable user.

For other models we have route `records`.

```
~: rails routes
     Prefix Verb URI Pattern Controller#Action
tramway_api      /api        Tramway::Api::Engine

Routes for Tramway::Api::Engine:
 v1_user_token POST   /v1/user_token(.:format)       tramway/api/v1/user_tokens#create
       v1_user GET    /v1/user(.:format)             tramway/api/v1/users#show
               POST   /v1/user(.:format)             tramway/api/v1/users#create
    v1_records GET    /v1/records(.:format)          tramway/api/v1/records#index
               POST   /v1/records(.:format)          tramway/api/v1/records#create
 new_v1_record GET    /v1/records/new(.:format)      tramway/api/v1/records#new
edit_v1_record GET    /v1/records/:id/edit(.:format) tramway/api/v1/records#edit
     v1_record GET    /v1/records/:id(.:format)      tramway/api/v1/records#show
               PATCH  /v1/records/:id(.:format)      tramway/api/v1/records#update
               PUT    /v1/records/:id(.:format)      tramway/api/v1/records#update
               DELETE /v1/records/:id(.:format)      tramway/api/v1/records#destroy

```

## Methods

### Initializer methods

#### auth_config

Sets default ActiveRecord model, which used as main user to be authenticated with JWT.

`user_model` - model name
`auth_attributes` - array of available attributes used as login. 

this model must have field `password_digest`, because we use `bcrypt` gem for authentication (providing other name of password attribute instead of `password` is coming soon)

### set_available_models

Sets ActiveRecord models which will be used in API

Enabled methods:

* create
* update
* show
* index
* destroy

### Index

Every model you've added in initializer will be able by URL `api/v1/records?model=#{model_class}`.

Just update your initializer:

```ruby
::Tramway::Api.set_available_models({ User => { %i[index] })
```

Create serializer

*app/serializers/user_serializer.rb*

```ruby
class UserSerializer < Tramway::Api::V1::ApplicationSerializer
  attributes :username, :email
end
```

Then write test:

```ruby
it 'returns status' do
  get '/api/v1/records', params: { model: 'User' }, headers: headers

  expect(response[:status]).to eq 200
end

it 'returns needed count' do
  get '/api/v1/records', params: { model: 'User' }, headers: headers

  expect(json_response[:data].size).to eq User.count
end
```

You have your records in JSON API spec.

You also able to use pagination, provided by `kaminari`

### Create

*config/initializers/tramway.rb*

```ruby
::Tramway::Api.set_available_models({ YourModel => [ :create ] }, project: :your_project_name })
```

*app/forms/your_model_form.rb*

```ruby
class YourModelForm < Tramway::ApplicationForm
  properties :attribute1, :attribute2, :name
  
  association :another_association_model
  
  def name=(value)
    model.first_name = value.split(' ')[0]
    model.first_name = value.split(' ')[1]
  end
end
```

Now you can your request. It has such structure

**POST** `/api/v1/records?model=YourModel`

```
Params Structure
{
  data: {
    attributes: {
      attribute1: 'some value',
      attribute2: 'some value',
      name: 'some full name',
      another_association_model: {
        # here a list of attributes, which you described in AnotherAssociationModelForm
      }
    }
  }
}
```

Also, you can test it with this 

*spec/factories/your_models.rb*

```ruby
FactoryBot.define do
  factory :your_model do
    attribute1 { # some code which generate value for this attribute }
    attribute2 { # some code which generate value for this attribute }
    name { generate :name }
  end
end
```

*spec/api/your_model_spec.rb*

```ruby
require 'rails_helper'

RSpec.describe 'Post generate token', type: :feature do
  describe 'POST /api/v1/user_token' do
    let(:user) { create :user, password: '123456789' }

    it 'returns created status' do
      post '/api/v1/user_token', params: { auth: { login: user.email, password: '123456789' }  }

      expect(response[:status]).to eq 201
    end
    
    it 'returns token' do
      post '/api/v1/user_token', params: { auth: { login: user.email, password: '123456789' }  }

      expect(json_response[:auth_token].present?).to be_truthy
      expect(json_response[:user]).to include_json({ email: user.email, uuid: user.uuid })
    end

  end
end
```

### Update

*config/initializers/tramway.rb*

```ruby
::Tramway::Api.set_available_models({ YourModel => [ :update ] }, project: :your_project_name })
```

*app/forms/your_model_form.rb*

```ruby
class YourModelForm < Tramway::ApplicationForm
  properties :attribute1, :attribute2, :name
  
  association :another_association_model
  
  def name=(value)
    model.first_name = value.split(' ')[0]
    model.first_name = value.split(' ')[1]
  end
end
```

Now you can your request. It has such structure

**PATCH** `/api/v1/records/#{object_id}?model=YourModel`

```
Params Structure
{
  data: {
    attributes: {
      attribute1: 'some value',
      attribute2: 'some value',
      name: 'some full name',
      another_association_model: {
        # here a list of attributes, which you described in AnotherAssociationModelForm
      }
    }
  }
}
```

### Show

#### Description

It returns just one record, if it is not deleted.

#### Using

##### Allow method show in tramway initializer for `YourModel` 

*config/initializers/tramway.rb*

```ruby
::Tramway::Api.set_available_models({ YourModel => [ :show ] }, project: :your_project_name })
```

##### Create serializer

*app/serializers/user_serializer.rb*

```ruby
class UserSerializer < Tramway::ApplicationSerializer
  attributes :username, :email
end
```

##### Run your server on the localhost `rails s`
##### Made this query to test new API method (for example: you can create file `bin/test_tramway.rb` with this lines):

```ruby
require 'net/http'

YourModel.create! attribute_1: 'some value', attribute_2: 'some_value'
Net::HTTP.get('localhost:3000', "/api/v1/records/#{YourModel.last.id}?model=YourModel")
```

### Destroy

Production ready

Docs coming soon

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
