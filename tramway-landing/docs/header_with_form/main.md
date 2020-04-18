#### 1. 

#### 2. Initialize `@header_with_form` variable in your WelcomeController

It should be something like that

[How-to-create-sign-up-form](https://github.com/ulmic/tramway-dev/blob/develop/tramway-auth/README.md#add-sign-up)

```ruby
class WelcomeController
  def index
    @header_with_form = UserSignUpForm.new User.new # `User` is your model which you want to Sign Up
  end
end
```
