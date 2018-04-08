require 'rails/generators'
require 'tramway/core/generators/install_generator'

module Tramway::Conference::Generators
  class InstallGenerator < ::Tramway::Core::Generators::InstallGenerator
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)

    def run_other_generators
      generate 'tramway:user:install'
      generate 'tramway:landing:install'
      generate 'tramway:profiles:install'
    end

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number next_migration_number
    end

    def copy_migrations
      ["create_tramway_conference_unities"].each do |migration_name|
        migration_template "#{migration_name}.rb", "db/migrate/#{migration_name}.rb"
      end
    end
  end
end
