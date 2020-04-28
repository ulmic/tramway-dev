# frozen_string_literal: true

require 'rails/generators'
require 'tramway/core/generators/install_generator'

module Tramway::Landing::Generators
  class InstallGenerator < ::Tramway::Core::Generators::InstallGenerator
    include Rails::Generators::Migration
    source_root File.expand_path('templates', __dir__)

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number next_migration_number
    end

    def copy_migrations
      migrations = %i[
        create_tramway_landing_blocks
        add_navbar_link_to_tramway_landing_blocks
        add_anchor_to_tramway_landing_blocks
        add_description_to_tramway_landing_blocks
        add_link_object_id_to_tramway_landing_blocks
        add_link_object_type_to_tramway_landing_blocks
        add_button_to_tramway_landing_blocks
        add_view_name_to_tramway_landing_blocks
        add_values_to_tramway_landing_blocks
        add_page_id_to_tramway_landing_blocks
        create_tramway_landing_forms
        create_tramway_landing_blocks_forms
      ]

      migrations.each do |migration|
        migration_template "#{migration}.rb", "db/migrate/#{migration}.rb"
      end
    end
  end
end
