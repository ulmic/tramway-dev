# Tramway::Admin
Short description and motivation.

## English readme

coming soon...

## Russian readme

Готовая админка для проекта. Она подготовлена для работы со всеми tramway плагинами, а также поддерживает и ваши модели тоже.

## Usage
How to use my plugin.

*Gemfile
```ruby
gem 'tramway-admin'
gem 'tramway-auth'
gem 'tramway-core'
gem 'tramway-user'
gem 'state_machine', github: 'seuros/state_machine'
gem 'bcrypt'
```

*config/routes.rb

```ruby
Rails.application.routes.draw do
  mount Tramway::Auth::Engine, at: '/auth'
  mount Tramway::Admin::Engine, at: '/admin'
end
```

And then execute:
```bash
$ bundle
$ rails g tramway:user:install
$ rails db:migrate
$ rails s
```

*app/config/initializers/tramway.rb*

```ruby
::Tramway::Admin.set_available_models 
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
