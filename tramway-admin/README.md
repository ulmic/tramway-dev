# Tramway::Admin
Short description and motivation.

## English readme

*If you need translation of this Readme, please message us kalashnikov@ulmic.ru. We'll translate for you and post to this page*

## Russian readme

Готовая админка для проекта. Она подготовлена для работы со всеми tramway плагинами, а также поддерживает и ваши модели тоже.

## Usage
How to use my plugin.

*Gemfile*
```ruby
gem 'tramway-admin'
gem 'tramway-auth'
gem 'tramway-core'
gem 'tramway-user'
gem 'state_machine', github: 'seuros/state_machine'
gem 'bcrypt'
gem 'haml-rails'
gem 'selectize-rails'
gem 'bootstrap'
gem 'jquery-rails'
gem 'copyright-mafa'
```

You should remove gem `turbolinks` from your application

*config/routes.rb*

```ruby
Rails.application.routes.draw do
  mount Tramway::Auth::Engine, at: '/auth'
  mount Tramway::Admin::Engine, at: '/admin'
end
```

Then make `tramway-core` installation. [How-to](https://github.com/ulmic/tramway-dev/blob/develop/tramway-core/README.md#installation)


And then execute:
```bash
$ bundle
$ rails g tramway:user:install
$ rails db:migrate

# Creating your first admin user

$ rails c
$> Tramway::User::User.create! email: 'your@email.com', password: '123456789', role: :admin

$ rails s
```

*app/config/initializers/tramway.rb*

```ruby
# set available models for your admin
::Tramway::Admin.set_available_models list_of_models
```

## Date Picker locale

DatePicker provides `ru`, `en` locales. To set needed locale, just add

```javascript
window.current_locale = window.i18n_locale('en');
```
to the `app/assets/javascripts/admin/application.js` file

**OR**

```coffeescript
window.current_locale = window.i18n_locale 'en'
```
to the `app/assets/javascripts/admin/application.js.coffee` file

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
