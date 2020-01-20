# Tramway

## If you want to edit roles to the Tramway::User::User class

#### 1. Create concern with the patch

*app/models/concerns/tramway/user/user.rb*
```ruby
module Tramway::User::User
  extend ActiveSupport::Concern
  
  included do
    enumerize :role, in: [ :admin, :supervisor ], default: :admin
    
    # method which will help you configurate admin access (by default is `:admin` role)
    def self.admin?
      role.in? [ 'admin', 'supervisor' ]
    end
  end
end
```
#### 2. Add concern loading into the initializers

*config/initializers/tramway_extensions.rb*
```ruby
Tramway::User::User.include Tramway::User::UserConcern
```

#### 3. Reload your server

**NOTE: BE CAREFUL**. You shouldn't remove roles after creating one or more records in Tramway::User::User table.
