#### 1. 

#### 2. Initialize `@header_with_form` variable in your WelcomeController

It should be something like that

```ruby
class WelcomeController
  def index
    @header_with_form = UserSignUpForm.new User.new
  end
end
```
