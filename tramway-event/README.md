# Tramway::Event
Short description and motivation.

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'tramway-event'
gem 'carrierwave'
gem 'more_html_tags'
```

And then execute:
```bash
$ bundle
```
*Gemfile*
```ruby
gem 'tramway-event'
```

Then run:
```shell
rails g tramway:event:install
rails db:migrate
```

Then make `tramway-landing` installation. [How-to](https://github.com/ulmic/tramway-dev/blob/develop/tramway-landing/README.md#installation)

*config/initializers/tramway.rb*
```ruby
Tramway::Admin.set_available_models ::Tramway::Event::Event, ::Tramway::Event::ParticipantFormField, ::Tramway::Event::Participant, project: #{project_which_you_used_in_the_application}
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
