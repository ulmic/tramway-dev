# frozen_string_literal: true

require 'rails/generators'
require 'tramway/generators/install_generator'

module Tramway::News::Generators
  class InstallGenerator < ::Tramway::Generators::InstallGenerator
    include Rails::Generators::Migration
    source_root File.expand_path('templates', __dir__)

    def run_other_generators; end

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number next_migration_number
    end

    def copy_migrations
      migration_template 'create_tramway_news_news.rb', 'db/migrate/create_tramway_news_news.rb'
    end
  end
end
