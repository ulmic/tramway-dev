require 'rails/generators'
require 'tramway/core/generators/install_generator'

module Tramway::Event::Generators
  class InstallGenerator < ::Tramway::Core::Generators::InstallGenerator
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    def run_other_generators
    end

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number next_migration_number
    end

    def copy_migrations
      migration_template 'create_tramway_event_events.rb', 'db/migrate/create_tramway_event_events.rb'
      migration_template 'add_photo_to_tramway_event_events.rb', 'db/migrate/add_photo_to_tramway_event_events.rb'
      migration_template 'create_tramway_event_participant_form_fields.rb', 'db/migrate/create_tramway_event_participant_form_fields.rb'
      migration_template 'create_tramway_event_participants.rb', 'db/migrate/create_tramway_event_participants.rb'
    end
  end
end
