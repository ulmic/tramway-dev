# frozen_string_literal: true

require 'rails/generators'
require 'tramway/core/generators/install_generator'

module Tramway::Conference::Generators
  class InstallGenerator < ::Tramway::Generators::InstallGenerator
    include Rails::Generators::Migration
    source_root File.expand_path('templates', __dir__)

    def run_other_generators
      generate 'tramway:user:install'
      generate 'tramway:landing:install'
      generate 'tramway:profiles:install'
      generate 'tramway:event:install'
      generate 'tramway:partner:install'
    end

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number next_migration_number
    end

    def copy_migrations
      migrations = %i[
        create_tramway_conference_unities
        add_url_to_tramway_conference_unities
        add_found_date_to_tramway_conference_unities
        add_email_to_tramway_conference_unities
        add_main_image_to_tramway_conference_unities
        add_favicon_to_tramway_conference_unities
        add_name_to_tramway_conference_unities
        add_public_name_to_tramway_conference_unities
      ]
      migrations.each do |migration_name|
        migration_template "#{migration_name}.rb", "db/migrate/#{migration_name}.rb"
      end
    end
  end
end
