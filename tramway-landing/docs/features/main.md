# Features (for programmers)

## English

coming soon...

## Русский

#### 1. Выберите в админке "Блок"
![admin-1](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-1.png)

#### 2. Нажмите на "+" - это создание нового Блока
![admin-2](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-2.png)

#### 3. Заполните форму созданя блока, как показано на скриншоте.

* Название блока будет отображаться как h2 в самом блоке на странице.
* Позицию блока выбираете по своему усмотрению
* Ссылка в навигационной панели появится также и в блоке Начальный (header)
* Якорь - это дополнительное слово в адресной строке после символа `#`, которое появится после нажатия на ссылку блока
* Якорь отвечает за название переменной, которое будет использоваться при сборе коллекции объектов, которые будут показываться

![admin-3](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/features/admin-1.png)

#### 4. Создайте декоратор для отображения карточек. Класс лучше наследовать от FeaturesDecorator из гема tramway-landing.

*app/decorators/your_name_decorator.rb*

```ruby
class YourNameDecorator < Tramway::Landing::BlockTypes::FeaturesDecorator
  def icon; end

  def image; end

  def title; end

  def text; end

  def anchor; end

  def full_text; end

  def external_link; end

  def active_link; end
end
```

#### 5. Соберите коллекцию объектов в контроллере, который отображает главную страницу. Обратите внимание, что название переменной должно составляться по такому паттерну "@collection_#{название_якоря_в_блоке}"

*app/controllers/web/welcome_controller.rb*

```ruby
class Tramway::SportSchool::Web::WelcomeController < ::Tramway::SportSchool::ApplicationController
  @collection_activities = Activity.active.published.map do |t|
    ActivityCardDecorator.new t # this decorator is inherited from Tramway::Landing::BlockTypes::FeaturesDecorator
  end
end
```

#### 6. Проверьте все данные, которые внесли и нажмите "Показать на сайте"
![admin-4](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/features/admin-2.png)

#### 7. Теперь, зайдите на главную страницу вашего сайта и проверяйте результат
