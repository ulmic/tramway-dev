# Contacts

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

![admin-3](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/contacts/admin-1.png)

#### 4. Добавьте во вьюху главной страницы данные о вашей организации для отображения карты и других пунктов в блоке Контактов

```haml
= content_for :latitude do
  = 54.3151358

= content_for :longtitude do
  = 48.3960357

= content_for :address do
  г. Ульяновск, ул. Гончрова, д. 24, 3 этаж

= content_for :schedule do
  Каждый день с 8.00 до 22.00

= content_for :phone do
  +79603727276
```

#### 5. Проверьте все данные, которые внесли и нажмите "Показать на сайте"
![admin-4](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/contacts/admin-2.png)

#### 6. Теперь, зайдите на главную страницу вашего сайта и проверяйте результат
![admin-4](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/contacts/example.png)

#### 7. Вы можете добавить ссылки на социальные сети в Блок Контактов с помощью гема tramway-profiles

[Инструкция](https://github.com/ulmic/tramway-dev/blob/develop/tramway-profiles/docs/main.md)

#### 8. Теперь, зайдите на главную страницу вашего сайта и проверяйте результат
![admin-4](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/tramway-landing/docs/contacts/example-2.png)
