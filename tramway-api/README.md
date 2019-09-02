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

Ограничения:

* только с ActiveRecord

## Использование

```
rails new tramway_api_sample
```

*Gemfile*

```
gem 'tramway-api', '>= 1.1.0.1'
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'tramway-api'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install tramway-api
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
