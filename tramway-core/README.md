# Tramway::Core

*If you need translation of this Readme, please message us kalashnikov@ulmic.ru. We'll translate for you and post to this page*

tramway-core - это ядро проекта [tramway](https://github.com/ulmic/tramway)

Этот гем предоставляет базовые классы и реализации для других шаблонов Tramway. Как правило, каждый шаблон Tramway должен иметь в зависимостях последнюю версию гема `tramway-core`.

# Installation

*Gemfile*
```ruby
gem 'tramway-core'
gem 'audited'
gem 'clipboard-rails'
```

```shell
rails g tramway:core:install
```

*config/initializers/tramway.rb*
```ruby
# Initialize application with name
Tramway::Core.initialize_application name: "Your application's name"

# Initialize application name with model_class. Model class must be a singlethon
Tramway::Core.initialize_application model_class: ::Tramway::Conference::Unity # example was taken from tramway-conference gem
```

*config/initializers/assets.rb*
```ruby
Rails.application.config.assets.precompile += %w( *.jpg *.png *.js )
```
# Usage
## Decorators
### Helper methods

#### date_view
Returns a date in the format depending on localization

*app/decorators/\*_decorator.rb*
```ruby
def created_at
  date_view object.created_at
end
```
#### datetime_view
Returns a date and time in the format depending on localization

*app/decorators/*_decorator.rb*
```ruby
def created_at
  datetime_view object.created_at
end
```
#### state_machine_view
Returns the state of an object according to a state machine

*app/decorators/*_decorator.rb*
```ruby
def state
  state_machine_view object, :state
end
```
#### image_view
Returns an image in a particular format depending on the parameters of the original image file

*app/decorators/\*_decorator.rb*
```ruby
def avatar
  image_view object.avatar
end
```
#### enumerize_view
Returns object enumerations as text

*app/decorators/\*_decorator.rb*
```ruby
def field_type
  enumerize_view object.field_type
end
```

## Other helpers

### CopyToClipboardHelper

[app/helpers/tramway/core/copy_to_clipboard_helper.rb](https://github.com/ulmic/tramway-dev/blob/develop/tramway-core/app/helpers/tramway/core/copy_to_clipboard_helper.rb)

#### Install

```ruby
include ::Tramway::Core::CopyToClipboardHelper
```

#### How to use it

It will show you in the view in bootstrap styles with font-awesome `copy` icon.

Something like this:

![copy_to_clipboard_button](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-core/docs/copy_to_clipboard_button.png)

```ruby
copy_to_clipboard "some_id" # some_id is HTML id of element. Content of this element will be copied to the clipboard after pressing the button
```

## How to create model that will be an Application Model for the Tramway

#### 1. Generate model that you to use. We create Organization, for example

```shell
rails g model organization title:text tagline:text address:text phone:text coordinates:point, state: text # remember! State field is required, if you use tramway-admin
rails db:migrate
```

#### 2. Add model_class to Initializer

```ruby
Tramway::Core.initialize_application model_class: Organization
```

#### 3. Add model to singleton to the `tramway-admin` admin panel to be able to change its data

```ruby
Tramway::Admin.set_singleton_models Organization, project: :organization # now you should use underscored model_class name as project name
```

#### 4. Create 1 instance of Organization model

```ruby
rails c
Organization.create! title: 'Tramway', tagline: 'Tramway is not buggy, LOL!'
```

## In Russian

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
