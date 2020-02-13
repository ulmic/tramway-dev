# Tramway

## If you want to edit roles to the Tramway::User::User class

#### 1. Create concern with the patch

*app/models/concerns/tramway/user/user.rb*
```ruby
module Tramway::User::UserConcern
  extend ActiveSupport::Concern
  
  included do
    enumerize :role, in: [ :admin, :supervisor ], default: :admin
  end
end
```
#### 2. Add concern loading into the initializers

*config/initializers/tramway_extensions.rb*
```ruby
module ::Tramway::Extensions
  def self.load
    Tramway::User::User.include Tramway::User::UserConcern
  end
end
```

#### 3. Reload your server

**NOTE: BE CAREFUL**. You shouldn't remove roles after creating one or more records in Tramway::User::User table.
**NOTE: BE CAREFUL 2**. All new roles instead of `user` will be have access to the admin panel

## Block soft deletion of some records

#### 1. Create concern with the patch

*app/models/concerns/tramway/user/user.rb*
```ruby
module YourModelConcern
  extend ActiveSupport::Concern
  
  included do
    def remove
      return if your_condition_here
      
      super
    end
  end
end
```
#### 2. Add concern loading into the initializers

*config/initializers/tramway_extensions.rb*
```ruby
module ::Tramway::Extensions
  def self.load
    YourModel.include YourModelConcern
  end
end
```

#### 3. Reload your server

**NOTE:** it's not about disabling of ActiveRecord `destroy` method.
