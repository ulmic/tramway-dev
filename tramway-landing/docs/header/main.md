# Header Block Type

## English

#### Code Example

*app/views/web/welcome/index.html.haml*

```haml
= content_for :application_name do
  = "This is `application_name` content"

= content_for :application_tagline do
  = "This is `application_tagline` content"
```

#### Result

![header-example](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/example.png)

## Русский

#### Перед созданием блока необходимо создать страницу, [инструкция по созданию сраниц](https://github.com/ulmic/tramway-dev/tree/develop/tramway-page#%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)

#### 1. После создания страницы нажмите "Добавить блоки"
![admin-1](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-1.png)

#### 2. Заполните форму созданя блока, как показано на скриншоте. Название, описание и изображение блока можете выбирать самостоятельно. В поле страница выберете страницу, на которой должен отображаться блок. Позиция на странице предпочтительна для такого типа блока - 1.
![admin-2](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-2.png)

#### 3. Нажмите "Показать на сайте"
![admin-3](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-3.png)

#### 4. Теперь, зайдите на страницу вашего сайта и проверяйте результат

![admin-4](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-4.png)

#### 6. Вы можете запрограммировать контент на главной странице

#### Пример кода

*app/views/web/welcome/index.html.haml*

```haml
= content_for :application_name do
  = "Название вашего сайта"

= content_for :application_tagline do
  = "Слоган вашего сайта (может использоваться как статус)"
```
