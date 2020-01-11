# Footer Block Type

## English

coming soon...

## Русский

#### 1. Выберите в админке "Блок"
![admin-1](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-1.png)

#### 2. Нажмите на "+" - это создание нового Блока
![admin-2](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-2.png)

#### 3. Заполните форму созданя блока, как показано на скриншоте. Название, описание и изображение блока можете выбирать самостоятельно. Позиция на странице предпочтительна для такого типа блока последняя.
![admin-3](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/footer/admin-1.png)

#### 4. Проверьте все данные, которые внесли и нажмите "Показать на сайте"
![admin-4](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/footer/admin-2.png)

#### 5. Теперь, зайдите на главную страницу вашего сайта и проверяйте результат

* На эту страницу уже добавлен блок типа Начальный (Header). [Инструкция по добавлению](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/header/main.md)
* *Мы исправляем проблемы с вёрсткой. Возможно, они уже исправлены, а скриншот просто не обновлён*

![admin-5](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/footer/example.png)



#### 6. Вы можете запрограммировать контент на главной странице

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
