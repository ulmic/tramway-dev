# frozen_string_literal: true

require 'rails/generators'
require 'tramway/core/generators/install_generator'

module Tramway::Page::Generators
  class InstallGenerator < ::Tramway::Core::Generators::InstallGenerator
    include Rails::Generators::Migration
    source_root File.expand_path('templates', __dir__)

    def run_other_generators; end

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number next_migration_number
    end

    def copy_migrations
      migrations = %i[
        create_tramway_page_pages
        add_view_to_tramway_page_pages
      ]
      migrations.each do |migration|
        migration_template "#{migration}.rb", "db/migrate/#{migration}.rb"
      end
    end
  end
end
