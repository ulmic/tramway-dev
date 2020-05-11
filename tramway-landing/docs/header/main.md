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

#### 1. Перед созданием блока необходимо создать страницу, [инструкция по созданию сраниц](https://github.com/ulmic/tramway-dev/tree/develop/tramway-page#%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
#### 1. Выберите в админке "Блок"
![admin-1](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-1.png)

#### 2. Нажмите на "+" - это создание нового Блока
![admin-2](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-2.png)

#### 3. Заполните форму созданя блока, как показано на скриншоте. Название, описание и изображение блока можете выбирать самостоятельно. Позиция на странице предпочтительна для такого типа блока - 1.
![admin-3](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-3.png)

#### 4. Проверьте все данные, которые внесли и нажмите "Показать на сайте"
![admin-4](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-4.png)

#### 5. Теперь, зайдите на главную страницу вашего сайта и проверяйте результат

![admin-5](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-5.png)

#### 6. Вы можете запрограммировать контент на главной странице

#### Пример кода

*app/views/web/welcome/index.html.haml*

```haml
= content_for :application_name do
  = "Название вашего сайта"

= content_for :application_tagline do
  = "Слоган вашего сайта (может использоваться как статус)"
```
