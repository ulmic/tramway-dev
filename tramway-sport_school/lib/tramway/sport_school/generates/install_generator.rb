# frozen_string_literal: true

require 'rails/generators'
require 'tramway/core/generators/install_generator'

module Tramway::SportSchool::Generators
  class InstallGenerator < ::Tramway::Core::Generators::InstallGenerator
    include Rails::Generators::Migration
    source_root File.expand_path('templates', __dir__)

    def run_other_generators
      generate 'tramway:user:install'
      generate 'tramway:landing:install'
      generate 'tramway:profiles:install'
      generate 'tramway:news:install'
      generate 'tramway:page:install'
      generate 'ckeditor:install --orm=active_record --backend=carrierwave'
    end

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number next_migration_number
    end

    def copy_migrations
      migrations = %i[
        create_tramway_sport_school_kind_sports
        add_state_to_tramway_sport_school_kind_sports
        add_image_to_tramway_sport_school_kind_sports
        create_tramway_sport_school_trainers
        create_tramway_sport_school_documents
        add_degree_to_tramway_sport_school_trainers
        add_description_to_tramway_sport_school_trainers
        create_tramway_sport_school_institutions
        add_description_to_tramway_sport_school_kind_sports
        create_tramway_sport_school_organizations
        add_contacts_to_tramway_sport_school_institutions
        add_ll_to_tramway_sport_school_institutions
        add_document_type_to_tramway_sport_school_documents
        add_url_to_tramway_sport_school_institutions
        add_found_date_to_tramway_sport_school_institutions
        add_name_to_tramway_sport_school_institutions
      ]
      migrations.each do |migration|
        migration_template "#{migration}.rb", "db/migrate/#{migration}.rb"
      end
      ::Tramway::SportSchool::Institution.create!
    end
  end
end
