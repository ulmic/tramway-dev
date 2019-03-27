require 'rails/generators'
require 'tramway/core/generators/install_generator'

module Tramway::Notify::Generators
  class InstallGenerator < ::Tramway::Core::Generators::InstallGenerator
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number next_migration_number
    end

    def copy_migrations
      migrations = [
        :create_tramway_notify_notifications
      ]
      migrations.each do |migration_name|
        migration_template "#{migration_name}.rb", "db/migrate/#{migration_name}.rb"
      end
    end
  end
end
