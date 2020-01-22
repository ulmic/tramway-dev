# frozen_string_literal: true

class AddContactsToTramwaySportSchoolInstitutions < ActiveRecord::Migration[5.1]
  def change
    add_column :tramway_sport_school_institutions, :name, :text
  end
end
