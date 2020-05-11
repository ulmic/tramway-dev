# Cards (for programmers)

## English

coming soon...

## Русский

#### Перед созданием блока необходимо создать страницу, [инструкция по созданию сраниц](https://github.com/ulmic/tramway-dev/tree/develop/tramway-page#%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)

#### 1. После создания страницы нажмите "Добавить блоки"
![admin-1](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-1.png)

#### 2. Заполните форму созданя блока, как показано на скриншоте.

* Название блока будет отображаться как h2 в самом блоке на странице.
* Позицию блока выбираете по своему усмотрению
* Ссылка в навигационной панели появится также и в блоке Начальный (header)
* Якорь - это дополнительное слово в адресной строке после символа `#`, которое появится после нажатия на ссылку блока
* Якорь отвечает за название переменной, которое будет использоваться при сборе коллекции объектов, которые будут показываться

![admin-2](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/cards/admin-1.png)

#### 3. Создайте декоратор для отображения карточек. Класс лучше наследовать от CardsDecorator из гема tramway-landing.

*app/decorators/your_name_decorator.rb*

```ruby
class YourNameDecorator < ::Tramway::Landing::BlockTypes::CardsDecorator
  def image; end

  def title; end

  def description; end

  def button; end

  def icon; end

  def path; end
end
```

#### 4. Соберите коллекцию объектов в контроллере, который отображает главную страницу. Пример взят из гема tramway-sport_school. Обратите внимание, что название переменной должно составляться по такому паттерну "@collection_#{название_якоря_в_блоке}"

*app/controllers/web/welcome_controller.rb*

```ruby
class Tramway::SportSchool::Web::WelcomeController < ::Tramway::SportSchool::ApplicationController
  @collection_trainers = ::Tramway::SportSchool::Trainer.active.published.map do |t|
    ::Tramway::SportSchool::Cards::TrainerDecorator.new t # this decorator is inherited from Tramway::Landing::BlockTypes::CardsDecorator
  end
end
```

#### 5. Проверьте все данные, которые внесли и нажмите "Показать на сайте"
![admin-5](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/cards/admin-2.png)

#### 6. Теперь, зайдите на главную страницу вашего сайта и проверяйте результат
