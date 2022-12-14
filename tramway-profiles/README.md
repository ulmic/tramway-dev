# Tramway::Profiles

This gem provides easy way to add info about social profiles of your organization

## Installation

#### 1. Add this line to your application's Gemfile:

```ruby
gem 'tramway-profiles'
```

#### 2. Generations

```shell
rails g tramway:profiles:install
rails db:migrate
```

#### 3. Install tramway-admin gem. [How-to](https://github.com/ulmic/tramway-dev/tree/develop/tramway-admin)

#### 4. Add social network to the admin panel

*app/initializers/tramway.rb*

```ruby
::Tramway.set_available_models(::Tramway::Profiles::SocialNetwork, project: :your_project_name)
```

#### 5. Now you have SocialNetwork objects in your project, that associated with [Tramway.application](https://github.com/ulmic/tramway-dev/tree/develop/tramway#how-to-create-model-that-will-be-an-application-model-for-the-tramway) by default

## Usage. English

...coming soon

## Использование
[Прочитайте нашу инструкцию по использованию гема](https://github.com/ulmic/tramway-dev/blob/develop/tramway-profiles/docs/main.md)

## Troubleshooting

1. `undefined method 'profile_link'` just add `include ::Tramway::Profiles::ApplicationHelper` to your main helper

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
