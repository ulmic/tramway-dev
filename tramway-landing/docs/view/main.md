# Just text block

## English

coming soon...

## Русский

### Руководсво программиста

#### Перед созданием блока необходимо создать страницу, [инструкция по созданию сраниц](https://github.com/ulmic/tramway-dev/tree/develop/tramway-page#%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)

Если вам нужна уникальная вёрстка в каком-либо блоке, вы можете обратиться к программисту, он создаст вам вьюху в директории `app/views/tramway/landing/blocks/views/#{my_view_name}` и выдаст название вьюхи, которую вы будете использовать в пункте 3.

#### 1. Выберите в админке "Блок"
![admin-1](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/header/admin-1.png)

#### 2. Заполните форму созданя блока, как показано на скриншоте.

* Название вьюхи: вам нужно создать вьюху в директории вашего проекта `app/views/tramway/landing/blocks/views/#{my_view_name}`. И my_view_name указать в этом поле
* Позицию блока выбираете по своему усмотрению
* Ссылка в навигационной панели появится также и в блоке Начальный (header)
* Якорь - это дополнительное слово в адресной строке после символа `#`, которое появится после нажатия на ссылку блока

![admin-3](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/view/admin-1.png)

#### 2. Проверьте все данные, которые внесли и нажмите "Показать на сайте"
![admin-4](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/view/admin-2.png)
