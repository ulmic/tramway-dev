# Tramway

## If you want to add new role to the Tramway::User::User class

#### 1. Create concern with the patch

*app/models/concerns/tramway/user/user.rb*
```ruby
module Tramway::User::User
  extend ActiveSupport::Concern
  
  included do
  end
end
```
