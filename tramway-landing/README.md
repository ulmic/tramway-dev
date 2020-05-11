## English

# Tramway::Landing
It uses [Material Design Bootstrap](https://mdbootstrap.com/) by default

Want to upgrade gem version?
Don't forget to look at [migration doc](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/migrations_to_version.md)

## Description

Tramway-landing provides several types of blocks for main page.

List of blocks:

* Header
* Header with form
* Footer
* Block with text and image
* Block with text, image and button
* Cards
* Features list
* Contacts, also Contacts without map
* View
* Just text
* Link to the object

All block's previews you can see at the bottom of this Readme

## Installation

#### 1. Add this line to your application's Gemfile:

```ruby
gem 'tramway-landing'
```

#### 2. Then run:

```shell
rails g tramway:landing:install
rails db:migrate
```

#### 3. Add landing blocks to the initializer

*config/initializers/tramway.rb*
```ruby
Tramway::Admin.set_available_models ::Tramway::Landing::Block, project: #{project_name_which_you_use_in_the_application}
Tramway::Admin.navbar_structure ::Tramway::Landing::Block
```

#### 4. Run server `rails s`
#### 5. Open `localhost:3000/admin`
#### 6. Click on `Blocks`, add new block with type `Header`
#### 7. Click `Show` in the block menu

#### 8. Then create your main page controller `rails g controller web/welcome`

*app/controllers/web/welcome_controller.rb*
```ruby
class Web::WelcomeController < ApplicationController
  before_action :application
  
  layout 'tramway/landing/application'

  def index
    @blocks = ::Tramway::Landing::BlockDecorator.decorate ::Tramway::Landing::Block.on_main_page
  end
  
  private
  
  def application
    @application = ::Tramway::Core.application_object
  end
end
```

#### 9. Add new controller to the routes

*config/routes.rb*
```ruby
# ...
root to: 'web/welcome#index'
# ...
```

#### 10. Add view for the new landing

*app/views/web/welcome/index.html.haml*
```haml
= content_for :title do
  -# your content for <title>
  
= content_for :application_name do
  -# your content for h1
  
= content_for :application_tagline do
  -# tagline in the header type block
  
= content_for :address do
  -# main address info

= content_for :phone do
  -# main phone info
  
= content_for :footer_links do
  -# list of footer links
  
= content_for :footer_logo do
  -# list of footer logos
  
= content_for :latitude do
  -# latitude for contacts block type map
  
= content_for :longtitude do
  -# longtitude for contacts block type map
  
-# everything you want on the main page
```

## Head Content

### Tramway::Landing 2.x

It will push this content to `<head>` tag in every landing page. Including public page in `tramway-event`, `tramway-sport_school`, `tramway-conference`, `tramway-news`, `tramway-page` gems. 

*config/initializers/tramway.rb*

```ruby
::Tramway::Landing.head_content = lambda do
  concat javascript_include_tag :application
  concat stylesheet_link_tag :application
  # don't forget to use `concat` method here
end
```

### Tramway::Landing 1.x

It will push this content to `<head>` tag only on main page. You aren't able to manage head tag in other gems and pages.

*app/views/web/welcome/index.html.haml*

```haml
= content_for :head_content do
  -# your content for <head>
```

Then all your showing blocks will be on the main page.

## Migrate from tramway-landing 2.x to tramway-landing 3.x

#### 1. Add tramway-page gem to the Gemfile

*Gemfile*
```ruby
gem 'tramway-page', '>= 1.4.1'
```

#### 2. Run install generator of tramway-page gem

```shell
rails g tramway:page:install
```

#### 3. Run upgraded generator of tramway-landing gem

```shell
rails g tramway:landing:install
```

#### 4. Create new Tramway::Page::Page object for main page

```ruby
$> rails c
Tramway::Page::Page.create! title: 'Main page', page_type: :main
```

#### 5. Associate every Tramway::Landing::Block with the main page

```ruby
$> rails c
Tramway::Landing::Block.update_all page_id: Tramway::Page::Page.last.id
```

## Blocks docs

How create blocks you can find here

* [Header](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/header/main.md)
* Header with form
* [Footer](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/footer/main.md)
* [Block with text and image](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/block_with_text_and_image/main.md)
* [Block with text, image and button](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/block_with_text_image_and_button/main.md)
* [Cards](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/cards/main.md)
* [Features list](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/features/main.md)
* [Contacts](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/contacts/main.md)
* Contacts without map
* [View](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/view/main.md)
* [Just text](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/just_text/main.md)
* Link to object

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Русский

Инструкцию по созданию блоков, Вы можете посмотреть здесь

* [Начальный (Header)](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/header/main.md#%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
* [Начальный блок с формой (Header)]()
* [Подвал (Footer)](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/footer/main.md#%D1%80%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
* [Свободный блок (картинка+текс)]()
* [Свободный блок с кнопкой (картинка + текст + кнопка)]()
* [Карточки (выводит опредеделенный набор карточек)]()
* [Список возможностей]()
* [Блок с контактами]()
* [Представление]()
* [Просто текст]()
* [Ссылка на объект]()
