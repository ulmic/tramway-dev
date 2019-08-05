![Logo](https://raw.githubusercontent.com/ulmic/tramway-dev/develop/logo.png)
###### Author [@noTea](https://vk.com/kiborgvviborge)
# Main Repo of Tramway Engine [![Build Status](https://travis-ci.org/ulmic/tramway-dev.svg?branch=develop)](https://travis-ci.org/ulmic/tramway-dev)

Gem name | Version and Link
-------- | ----------------
[tramway-admin](https://github.com/ulmic/tramway-dev/tree/develop/tramway-admin) | [![Gem Version](https://badge.fury.io/rb/tramway-admin.svg)](https://badge.fury.io/rb/tramway-admin)
[tramway-api](https://github.com/ulmic/tramway-dev/tree/develop/tramway-api) | [![Gem Version](https://badge.fury.io/rb/tramway-api.svg)](https://badge.fury.io/rb/tramway-api)
[tramway-auth](https://github.com/ulmic/tramway-dev/tree/develop/tramway-auth) | [![Gem Version](https://badge.fury.io/rb/tramway-auth.svg)](https://badge.fury.io/rb/tramway-auth)
[tramway-conference](https://github.com/ulmic/tramway-dev/tree/develop/tramway-conference) | [![Gem Version](https://badge.fury.io/rb/tramway-conference.svg)](https://badge.fury.io/rb/tramway-conference)
[tramway-core](https://github.com/ulmic/tramway-dev/tree/develop/tramway-core) | [![Gem Version](https://badge.fury.io/rb/tramway-core.svg)](https://badge.fury.io/rb/tramway-core)
[tramway-event](https://github.com/ulmic/tramway-dev/tree/develop/tramway-event) | [![Gem Version](https://badge.fury.io/rb/tramway-event.svg)](https://badge.fury.io/rb/tramway-event)
[tramway-export](https://github.com/ulmic/tramway-dev/tree/develop/tramway-export) | [![Gem Version](https://badge.fury.io/rb/tramway-export.svg)](https://badge.fury.io/rb/tramway-export)
[tramway-landing](https://github.com/ulmic/tramway-dev/tree/develop/tramway-landing) | [![Gem Version](https://badge.fury.io/rb/tramway-landing.svg)](https://badge.fury.io/rb/tramway-landing)
[tramway-mailout](https://github.com/ulmic/tramway-dev/tree/develop/tramway-mailout) | [![Gem Version](https://badge.fury.io/rb/tramway-mailout.svg)](https://badge.fury.io/rb/tramway-mailout)
[tramway-news](https://github.com/ulmic/tramway-dev/tree/develop/tramway-news) | [![Gem Version](https://badge.fury.io/rb/tramway-news.svg)](https://badge.fury.io/rb/tramway-news)
[tramway-notify](https://github.com/ulmic/tramway-dev/tree/develop/tramway-notify) | [![Gem Version](https://badge.fury.io/rb/tramway-notify.svg)](https://badge.fury.io/rb/tramway-notify)
[tramway-page](https://github.com/ulmic/tramway-dev/tree/develop/tramway-page) | [![Gem Version](https://badge.fury.io/rb/tramway-page.svg)](https://badge.fury.io/rb/tramway-page)
[tramway-partner](https://github.com/ulmic/tramway-dev/tree/develop/tramway-partner) | [![Gem Version](https://badge.fury.io/rb/tramway-partner.svg)](https://badge.fury.io/rb/tramway-partner)
[tramway-profiles](https://github.com/ulmic/tramway-dev/tree/develop/tramway-profiles) | [![Gem Version](https://badge.fury.io/rb/tramway-profiles.svg)](https://badge.fury.io/rb/tramway-profiles)
[tramway-site](https://github.com/ulmic/tramway-dev/tree/develop/tramway-site) | [![Gem Version](https://badge.fury.io/rb/tramway-site.svg)](https://badge.fury.io/rb/tramway-site)
[tramway-sport_school](https://github.com/ulmic/tramway-dev/tree/develop/tramway-sport_school) | [![Gem Version](https://badge.fury.io/rb/tramway-sport_school.svg)](https://badge.fury.io/rb/tramway-sport_school)
[tramway-user](https://github.com/ulmic/tramway-dev/tree/develop/tramway-user) | [![Gem Version](https://badge.fury.io/rb/tramway-user.svg)](https://badge.fury.io/rb/tramway-user)

## Docs English

... coming soon

## Docs Russian

Tramway - набор Rails гемов. Каждый гем является mountable библиотекой, которая предоставляет по сути готовый функционал или абстракции для быстрого создания **простых и маленьких** сайтов.

# Мотивация

Tramway решает две проблемы:

* *постоянное повторение кода в разных Rails проектах*. Разработчики при создании новых проектов часто создают дополнительные абстракции, которые нужны им для работы над проектом. Tramway предоставляет такие абстракции. Безусловно, выбор абстракций - это выбор каждого специалиста. В Tramway есть из чего выбирать. **В данный момент, некоторые предоставляемые абстракции избыточны. Проблема решается**
* *предоставляет готовый функционал для создания сайтов некоммерческих проектов*. Большинство сайтов некоммерческих проектов 
имеют похожие задачи и цели. Достигать этих целей помогает функциональность сайтов этих некомммерческих проектов. Эта функциональность предоставляет Tramway. Выбор сферы деятельности связан с деятельностью автора проекта.

Архитектура Tramway предполагает создание готового функционала для видов деятельности. Например, в данный момент реализован минимальный набор функциональности для сайтов спортивных школ.

Гем | Описание
-------- | ----------------
[tramway-admin](https://github.com/ulmic/tramway-dev/tree/develop/tramway-admin) | **Абстракция**: Админка
[tramway-api](https://github.com/ulmic/tramway-dev/tree/develop/tramway-api) | **Абстракция**: внутреннее API
[tramway-auth](https://github.com/ulmic/tramway-dev/tree/develop/tramway-auth) | **Абстракция**: авторизация пользователя в Web 
[tramway-conference](https://github.com/ulmic/tramway-dev/tree/develop/tramway-conference) | **Функциональность**: Сайт конференций (сейчас является функциональностью для некоммерческого проекта, будет переименован)
[tramway-core](https://github.com/ulmic/tramway-dev/tree/develop/tramway-core) | **Абстракция**: нужные абстракции для создания небольшого сайта на Rails
[tramway-event](https://github.com/ulmic/tramway-dev/tree/develop/tramway-event) | **Функциональность**: функциональность мероприятий. Является составной частью [tramway-conference](https://github.com/ulmic/tramway-dev/tree/develop/tramway-conference)
[tramway-export](https://github.com/ulmic/tramway-dev/tree/develop/tramway-export) | **Функциональность**: выгрузка списков в XLS документы. Нативно подключается к [tramway-admin](https://github.com/ulmic/tramway-dev/tree/develop/tramway-admin)
[tramway-landing](https://github.com/ulmic/tramway-dev/tree/develop/tramway-landing) | **Абстракция**: Функциональность для создания landing страницы. Является составной частью [tramway-conference](https://github.com/ulmic/tramway-dev/tree/develop/tramway-conference) и [tramway-sport_school](https://github.com/ulmic/tramway-dev/tree/develop/tramway-sport_school)
[tramway-mailout](https://github.com/ulmic/tramway-dev/tree/develop/tramway-mailout) | *(не готово)* **Функциональность**: функциональность массовых рассылок
[tramway-news](https://github.com/ulmic/tramway-dev/tree/develop/tramway-news) | **Функциональность**: новости на сайте. Является составной частью [tramway-sport_school](https://github.com/ulmic/tramway-dev/tree/develop/tramway-sport_school) | [![Gem Version](https://badge.fury.io/rb/tramway-sport_school.svg)](https://badge.fury.io/rb/tramway-sport_school)
[tramway-notify](https://github.com/ulmic/tramway-dev/tree/develop/tramway-notify) | **Функциональность**: оповещения пользователей
[tramway-page](https://github.com/ulmic/tramway-dev/tree/develop/tramway-page) | **Функциональность**: информационные страницы. Является составной частью [tramway-conference](https://github.com/ulmic/tramway-dev/tree/develop/tramway-conference) и [tramway-sport_school](https://github.com/ulmic/tramway-dev/tree/develop/tramway-sport_school)
[tramway-partner](https://github.com/ulmic/tramway-dev/tree/develop/tramway-partner) | **Функциональность**: партнёры. Является составной частью [tramway-conference](https://github.com/ulmic/tramway-dev/tree/develop/tramway-conference)
[tramway-profiles](https://github.com/ulmic/tramway-dev/tree/develop/tramway-profiles) | **Функциональность**: профили социальных сетей. Является составной частью [tramway-conference](https://github.com/ulmic/tramway-dev/tree/develop/tramway-conference) и [tramway-sport_school](https://github.com/ulmic/tramway-dev/tree/develop/tramway-sport_school)
[tramway-site](https://github.com/ulmic/tramway-dev/tree/develop/tramway-site) | **Функциональность**: сайт персоналии
[tramway-sport_school](https://github.com/ulmic/tramway-dev/tree/develop/tramway-sport_school) | **Функциональность**: сайт спортивной школы
[tramway-user](https://github.com/ulmic/tramway-dev/tree/develop/tramway-user) | **Функциональность**: пользователи. Является составной частью [tramway-conference](https://github.com/ulmic/tramway-dev/tree/develop/tramway-conference) и [tramway-sport_school](https://github.com/ulmic/tramway-dev/tree/develop/tramway-sport_school)

## Products

* [IT Way](http://it-way.pro)
* [Peklo Tool](https://tool.peklo.studio/)
* [kalashnikovisme.ru](http://kalashnikovisme.ru)
* [МБУ ДО ДЮСШ Ленинского района](http://sportschool-ulsk.ru/) (не поддерживается)
