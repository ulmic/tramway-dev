# Tramway::Admin
Short description and motivation.

## English readme

coming soon...

## Russian readme

coming soon...

## Usage
How to use my plugin.

```ruby
gem 'tramway-admin'
```

And then execute:
```bash
$ bundle
```

*app/config/initializers/tramway.rb*

```ruby
::Tramway::Admin.set_available_models 
```

## Date Picker locale

DatePicker provides `ru`, `en` locales. To set needed locale, just add

```javascript
window.i18n_locale('en');
```
to the `app/assets/javascripts/admin/application.js` file

**OR**

```coffeescript
window.i18n_locale 'en'
```
to the `app/assets/javascripts/admin/application.js.coffee` file

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
