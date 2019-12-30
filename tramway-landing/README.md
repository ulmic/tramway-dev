# Tramway::Landing
Short description and motivation.

## Usage
How to use my plugin.

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
  def index
    @blocks = ::Tramway::Landing::BlockDecorator.decorate ::Tramway::Landing::Block.on_main_page
  end
end
```

*config/routes.rb*
```ruby
# ...
root to: 'web/welcome#index'
# ...
```

Then all your showing blocks will be on the main page.

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
