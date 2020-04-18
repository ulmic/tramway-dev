# Tramway::Auth
Short description and motivation.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'tramway-auth'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install tramway-auth
```

## Usage

### Add sign up

#### 1. Create model sign up form

We have `User` model. System will create instances of this model on Sign Up. Then we should create `UserSignUpForm`.

```ruby
class UserSignUpForm < Tramway::Core::ApplicationForm
  properties :email, :password # you may add all you needed properties here
  
  def initiailize(object)
    super(object).tap do
      self.submit_message = 'Sign Up'
      form_properties email: :string,
        first_name: :string,
        last_name: :string,
        password: :default
    end
  end
end
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
