# Tramway::Landing
Short description and motivation.

## Description

Tramway-landing provides several types of blocks for main page.

List of blocks:

* Header
* Footer
* Block with text and image
* Block with text, image and button
* Cards
* Features list
* Contacts
* News
* Block with text and button
* View
* Just text

All block's previews you can see at the bottom of this Readme

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'tramway-landing'
```

Then run:

```shell
rails g tramway:landing:install
rails db:migrate
```

*config/initializers/tramway.rb*
```ruby
Tramway::Admin.set_available_models ::Tramway::Landing::Block, project: #{project_name_which_you_use_in_the_application}
```

Run server `rails s`
Open `localhost:3000/admin`
Click on `Block`, add new block with type `Header`
Click `Show` in the block menu

Then create your main page controller `rails g controller web/welcome`

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

*config/routes.rb*
```ruby
# ...
root to: 'web/welcome#index'
# ...
```

*app/views/web/welcome/index.html.haml*
```haml
= content_for :head_content do
  -# your content for <head>
  
= content_for :title do
  -# your content for <title>
  
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

Then all your showing blocks will be on the main page.

## Blocks

How create blocks you can find here

* [Header](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/header/main.md)
* [Footer](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/docs/footer/main.md)
* Block with text and image
* Block with text, image and button
* Cards
* Features list
* Contacts
* News
* Block with text and button
* View
* Just text

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
