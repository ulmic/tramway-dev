# Footer Block Type

## English

coming soon...

## Русский

#### Перед созданием блока необходимо создать страницу, [инструкция по созданию сраниц](https://github.com/ulmic/tramway-dev/tree/develop/tramway-page#%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)

#### 1. После создания страницы нажмите "Добавить блоки"
![admin-1](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-2.png)

#### 2. Заполните форму созданя блока, как показано на скриншоте. Название, описание и изображение блока можете выбирать самостоятельно. В поле страница выберете страницу, на которой должен отображаться блок. Позиция на странице предпочтительна для такого типа блока последняя.
![admin-2](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/footer/admin-1.png)

#### 3. Нажмите "Показать на сайте"
![admin-3](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/footer/admin-2.png)

#### 5. Теперь, зайдите на страницу вашего сайта и проверяйте результат

* На эту страницу уже добавлен блок типа Начальный (Header). [Инструкция по добавлению](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/header/main.md)
* *Мы исправляем проблемы с вёрсткой. Возможно, они уже исправлены, а скриншот просто не обновлён*

![admin-5](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/footer/example.png)


### Руководство программиста

#### Вы можете запрограммировать контент странице

#### Пример кода

*app/views/web/welcome/index.html.haml*

```haml
= content_for :footer_links do
  %h5
    Важные ссылки здесь
  %ul
    = link_to 'Ссылка 1', 'http://it-way.pro'
    %br
    = link_to 'Ссылка 2', 'http://molodoy.online'

= content_for :footer_logos do
  = link_to 'http://it-way.pro' do
    = image_tag 'logos/it_way_conf.png'
```
