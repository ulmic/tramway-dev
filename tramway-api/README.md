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

Ограничения:

* только с ActiveRecord
* только с версией Rails 5.1.* (поддержка 5.2 вскоре будет реализована автором гема, поддержка автором Rails 6 начнётся с версии 6.1. По религиозным автор не использует Rails версий *.0.*

Недостатки, которые будут вскоре ликвидированы:

* ядро `tramway-core` подгружает в себя ненужных для API гемов (недостаток не имеет смысла в случае использования вместе с этим решением гема `tramway-admin`):
  * bootstrap
  * font_awesome5_rails
  * haml

## Usage

```
rails new tramway_api_sample
```

*Gemfile*

```ruby
gem 'tramway-api', '>= 1.1.0.1'
```

Run `bundle install`

Create file `config/initializers/tramway.rb`

```ruby
::Tramway::Api.auth_config = { user_model: User, auth_attributes: %i[email username] }
::Tramway::Api.set_available_models user: %i[create update]
```


## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
