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
class User < ApplicationRecord
  has_secure_password
end
```

Create file `config/initializers/tramway.rb`

```ruby
::Tramway::Api.auth_config = { user_model: User, auth_attributes: %i[email username] }
::Tramway::Api.set_available_models user: %i[create update]
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

Create file `spec/tramway_api_spec.rb` with:

```ruby
require 'rails_helper'

RSpec.describe 'Post creating user', type: :feature do
  describe 'POST /api/v1/user with model User' do
    let(:attributes) { attributes_for :user }

    it 'returns created status' do
      post '/api/v1/user', params: { user: attributes }
      expect(response.status).to eq 201
    end
  end
end
```

## Methods

### Initializer methods

#### auth_config

Sets default ActiveRecord model, which used as main user to be authenticated with JWT.

`user_model` - model name
`auth_attributes` - array of available attributes used as login. 

this model must have field `password_digest`, because we use `bcrypt` gem for authentication (providing other name of password attribute instead of `password` is coming soon)


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
