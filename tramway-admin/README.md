# Tramway::Admin
Short description and motivation.

## English readme

*If you need translation of this Readme, please message us kalashnikov@ulmic.ru. We'll translate for you and post to this page*

## Russian readme

Готовая админка для проекта. Она подготовлена для работы со всеми tramway плагинами, а также поддерживает и ваши модели тоже.

## Usage
How to use my plugin.

*Gemfile*
```ruby
gem 'tramway-admin'
gem 'tramway-auth'
gem 'tramway-core'
gem 'tramway-user'
gem 'state_machine', github: 'seuros/state_machine'
gem 'bcrypt'
gem 'haml-rails'
gem 'selectize-rails'
gem 'bootstrap'
gem 'jquery-rails'
gem 'copyright-mafa'
gem 'trap'
gem 'kaminari'
gem 'bootstrap-kaminari-views', github: 'kalashnikovisme/bootstrap-kaminari-views', branch: :master
gem 'state_machine_buttons'
gem 'ckeditor', '4.2.4'
gem 'ransack'
gem 'smart_buttons'
```

You should remove gem `turbolinks` from your application

*config/routes.rb*

```ruby
Rails.application.routes.draw do
  mount Tramway::Auth::Engine, at: '/auth'
  mount Tramway::Admin::Engine, at: '/admin'
end
```

Then make `tramway-core` installation. [How-to](https://github.com/ulmic/tramway-dev/blob/develop/tramway-core/README.md#installation)


And then execute:
```bash
$ bundle
$ rails g tramway:user:install
$ rails db:migrate

# Creating your first admin user

$ rails c
$> Tramway::User::User.create! email: 'your@email.com', password: '123456789', role: :admin
```

*app/config/initializers/tramway.rb*

```ruby
# set available models for your admin
::Tramway::Admin.set_available_models list_of_models, project: #{project_name_which_you_used_in_application_name}
::Tramway::Auth.root_path = '/admin' # you need it to redirect in the admin panel after admin signed_in
```

By default users with role `admin` have access to all models used as arguments in method `::Tramway::Admin.set_available_models`. If you want specify models by roles, use them as keys

```ruby
::Tramway::Admin.set_available_models ::Tramway::Event::Event, ::Tramway::Event::ParticipantFormField,
  ::Tramway::Event::Participant, ::Tramway::Landing::Block, ::Tramway::User::User,
  ::Tramway::Profiles::SocialNetwork, project: #{project_name_which_you_used_in_application_name}, role: :admin

::Tramway::Admin.set_available_models ::Tramway::Event::Event, ::Tramway::Event::ParticipantFormField,
  ::Tramway::Event::Participant, project: #{project_name_which_you_used_in_application_name}, role: :another_role
```

You can set functions which are available by default some CRUD functions for any role:

```ruby
# this line gives access only index page to YourModel for partner role
::Tramway::Admin.set_available_models YourModel => [ :index ], role: :partner
```

You can set conditions for functions which are available for any role:

```ruby
# this line gives access to destroy only record with name `Elon Musk`

::Tramway::Admin.set_available_models YourModel => [
  destroy => lambda do |record|
    record.name == 'Elon Musk'
  end
 ], role: :partner
```

Here docs about changing roles of `Tramway::User::User` model [Readme](https://github.com/ulmic/tramway-dev/tree/develop/tramway#if-you-want-to-edit-roles-to-the-tramwayuseruser-class)

Run server `rails s`
Launch `localhost:3000/admin`

## Date Picker locale

DatePicker provides `ru`, `en` locales. To set needed locale, just add

```javascript
window.current_locale = window.i18n_locale('en');
```
to the `app/assets/javascripts/admin/application.js` file

**OR**

```coffeescript
window.current_locale = window.i18n_locale 'en'
```
to the `app/assets/javascripts/admin/application.js.coffee` file

## Notifications

You can add notification to your admin panel to the navbar.

To add notification to application, you need just set queries in initializers.

*config/initializers/tramway.rb*
```ruby
::Tramway::Admin.set_notificable_queries :"#{your_title}"  => -> { your_query }

# Example from tramway-event gem (you also can push context variables here)

::Tramway::Admin.set_notificable_queries new_participants: -> (current_user) do
  ::Tramway::Event::Participant.active.where(participation_state: :requested).send "#{current_user}_scope", current_user.id
end
```

## Admin Main Page management

Start page of admin panel contains only `application.name` by default. To manage it just set `Tramway::Admin.welcome_page_actions` with some lambda and set `@content` variable with HTML.

Example:

```ruby
::Tramway::Admin.welcome_page_actions = lambda do
  @content = '<a href="http://it-way.pro">IT Way</a>'
end
```

## Navbar management

You can manage your navbar easy

```ruby
Tramway::Admin.navbar_structure(
  YourModel, # this line will create first-level link in your navbar, which will send you to the YourModel management
  {
    my_dropdown: [ # this line contains dropdown link name
      AnotherYourModel # this line will create 2nd-level link in your navbar, which will send you to the YourModel management,
      :divider # this line adds bootstrap divider to the dropdown list
    ]
  }
)
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
