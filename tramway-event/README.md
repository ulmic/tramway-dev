# Tramway::Event
Short description and motivation.

## Usage
How to use my plugin.

## Installation

#### 1. Add this line to your application's Gemfile:

```ruby
gem 'tramway-event'
gem 'carrierwave'
gem 'more_html_tags'
```

#### 2. And then execute:
```bash
$ bundle
```

#### 3. Then run:
```shell
rails g tramway:event:install
rails db:migrate
```

#### 4. Then make `tramway-landing` installation. [How-to](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/README.md#installation)

Versions table

| tramway-event | tramway-landing |
| ------------- | --------------- |
| < 1.9.27.1 | 1.x |
| >= 1.9.27.2 | 2.x | 

#### 5. Add events to admin panel

*config/initializers/tramway.rb*
```ruby
Tramway::Admin.set_available_models ::Tramway::Event::Event, ::Tramway::Event::ParticipantFormField, ::Tramway::Event::Participant, project: #{project_which_you_used_in_the_application}
```

#### 6. Add events routes to the app

*config/routes.rb*
```ruby
mount Tramway::Event::Engine, at: '/'
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
