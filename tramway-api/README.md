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
* все модели, которые будут использованы гемом должны наследоваться от `Tramway::Core::ApplicationRecord`
* все модели, которые будут использованы гемом должны иметь атрибут `state`, типа `string` или `text`. Этот атрибут нужен для реализации мягкого удаления. Полное удаление записей из базы не поддерживается
* все модели, которые будут использованы гемом должны иметь атрибут 

Недостатки, которые будут вскоре ликвидированы:

* ядро `tramway-core` подгружает в себя ненужных для API гемов (недостаток не имеет смысла в случае использования вместе с этим решением гема `tramway-admin`):
  * bootstrap
  * font_awesome5_rails
  * haml
* требуется ручное добавление требуемых для работы гемов
  ```ruby
  gem 'active_model_serializers', '0.10.5'
  gem 'tramway-core'
  gem 'state_machine', github: 'seuros/state_machine'
  gem 'knock'
  gem 'audited'
  ```

## Usage

```
rails new tramway_api_sample
```

*Gemfile*

```ruby
gem 'tramway-api', '>= 1.1.0.1'
gem 'active_model_serializers', '0.10.5'
gem 'tramway-core'
gem 'state_machine', github: 'seuros/state_machine'
gem 'knock'
```

Run `bundle install`

Then generate User (you use another name, it's just an example) model

```
rails g model user email:text password_digest:text username:text state:text uid:text
```

Add generating uid by default

*db/migrate/create_users_*.rb

```ruby
t.uuid :uid, default: 'uuid_generate_v4()'
```

*app/models/user.rb*

```ruby
class User < Tramway::Core::ApplicationRecord
  has_secure_password
  
  def self.from_token_payload(payload)
    find_by uuid: payload['sub']
  end
end
```

Create file `config/initializers/tramway.rb`

```ruby
::Tramway::Api.auth_config = { user_model: User, auth_attributes: %i[email username] }
::Tramway::Api.set_available_models user: { open: %i[create], closed: %i[update] }
```

Run `rails g tramway:core:install`

Run `rails db:create db:migrate`

*config/routes.rb*

```ruby
Rails.application.routes.draw do
  mount Tramway::Api::Engine, at: '/api'
end
```

Create file *app/forms/user_sign_up_form.rb*

```ruby
class UserSignUpForm < Tramway::Core::ApplicationForm
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
      expect(response.status).to eq 201
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
  describe 'POST /api/v1/user_token' do
    let(:user) { create :user, password: '123456789' }

    it 'returns created status' do
      post '/api/v1/user_token', params: { auth: { login: user.email, password: '123456789' }  }

      expect(response.status).to eq 201
    end
    
    it 'returns token' do
      post '/api/v1/user_token', params: { auth: { login: user.email, password: '123456789' }  }

      expect(json_response[:auth_token].present?).to be_truthy
      expect(json_response[:user]).to include_json({ email: user.email, uid: user.uid })
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

Argument is a hash. Keys are underscored models names, values are hashes with actions of available methods for every model.
* `open` key means that this action will be used without authentication
* `closed` key means that this action will be used with authentication


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
::Tramway::Api.set_available_models user: { open: %i[create], closed: %i[update index] } # we've added index method
```

Create serializer

*app/serializers/user_serializer.rb*

```ruby
class UserSerializer < Tramway::Core::ApplicationSerializer
  attributes :username, :email
end
```

Then write test:

```ruby
it 'returns status' do
  get '/api/v1/records', params: { model: 'User' }, headers: headers

  expect(response.status).to eq 200
end

it 'returns needed count' do
  get '/api/v1/records', params: { model: 'User' }, headers: headers

  expect(json_response[:data].size).to eq User.active.count
end
```

You have your records in JSON API spec.

### Create

Production ready

Docs coming soon

### Update

Production ready

Docs coming soon

### Show

Production ready

Docs coming soon

### Destroy

Production ready

Docs coming soon

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
