# Footer Block Type

## English

coming soon...

## Русский

#### Перед созданием блока необходимо создать страницу, [инструкция по созданию сраниц](https://github.com/ulmic/tramway-dev/tree/develop/tramway-page#%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)

#### 1. После создания страницы нажмите "Добавить блоки"
![admin-1](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-1.png)

#### 2. Заполните форму созданя блока, как показано на скриншоте. Название, описание и изображение блока можете выбирать самостоятельно. Выберете старницу, на которой хотите видеть данный блок. Позицию на странице выберете любую.
![admin-2](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/block_with_text_image_and_button/admin-1.png)

#### 4. Нажмите "Показать на сайте"
![admin-4](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/block_with_text_image_and_button/admin-2.png)

#### 5. Теперь, зайдите на страницу вашего сайта и проверяйте результат

![admin-5](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/block_with_text_image_and_button/example.png)

### Руководство программиста

#### Вы можете запрограммировать контент на главной странице

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
