# Tramway::Core

*If you need translation of this Readme, please message us kalashnikov@ulmic.ru. We'll translate for you and post to this page*

tramway-core - это ядро проекта [tramway](https://github.com/ulmic/tramway)

Этот гем предоставляет базовые классы и реализации для других шаблонов Tramway. Как правило, каждый шаблон Tramway должен иметь в зависимостях последнюю версию гема `tramway-core`.

# Installation

```shell
gem install tramway-core
rails g tramway:core:install
```

*config/initializers/tramway.rb*
```ruby
# Initialize application with name
Tramway::Core.initialize_application name: "Your application's name"

# Initialize application name with model_class. Model class must be a singlethon
Tramway::Core.initialize_application model_class: ::Tramway::Conference::Unity # example was taken from tramway-conference gem
```

# Базовые классы

* ApplicationDecorator - Базовый класс декоратора. В него по умолчанию включены `ActionView::Helpers` и `ActionView::Context` и `FontAwesome5` (версия гема FontAwesome, которая поддерживает 5 версию шрифта). `FontAwesome` считается в `Tramway` основным шрифтом для иконок.
* ApplicationForm - наследованный от Reform::Form класс форм.
* ApplicationRecord  - базовый класс для AR моделей
* ApplicationUploader - базовый класс для Carrierwave аплоадеров.
* FileUploader - базовый класс для загрузки файлов
* PhotoUploader - базовый класс для загрузки фотографий
* Вьюха `_messages` - предоставляет отображение ошибок в форме. Совместима с AR и Reform

# Локализация

* dates - правила локализации даты
* helpers - часто используемые в формах слова
* models - часто используемые в моделях слова
* state_machines - локализация состояний

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
