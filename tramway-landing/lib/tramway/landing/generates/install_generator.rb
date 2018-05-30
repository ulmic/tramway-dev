require 'rails/generators'
require 'tramway/core/generators/install_generator'

module Tramway::Landing::Generators
  class InstallGenerator < ::Tramway::Core::Generators::InstallGenerator
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number next_migration_number
    end

    def copy_migrations
      migration_template 'create_tramway_landing_blocks.rb', 'db/migrate/create_tramway_landing_blocks.rb'
      migration_template 'add_navbar_link_to_tramway_landing_blocks.rb', 'db/migrate/add_navbar_link_to_tramway_landing_blocks.rb'
      migration_template 'add_anchor_to_tramway_landing_blocks.rb', 'db/migrate/add_anchor_to_tramway_landing_blocks.rb'
      migration_template 'add_description_to_tramway_landing_blocks.rb', 'db/migrate/add_description_to_tramway_landing_blocks.rb'
      migration_template 'add_link_object_id_to_tramway_landing_blocks.rb', 'db/migrate/add_link_object_id_to_tramway_landing_blocks.rb'
      migration_template 'add_link_object_type_to_tramway_landing_blocks.rb', 'db/migrate/add_link_object_type_to_tramway_landing_blocks.rb'
    end
  end
end
