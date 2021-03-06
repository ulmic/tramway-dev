# frozen_string_literal: true

class CreateTramwaySportSchoolTrainers < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_sport_school_trainers do |t|
      t.text :first_name
      t.text :last_name
      t.text :patronymic
      t.text :state, default: :active
      t.text :view_state, default: :hidden

      t.timestamps
    end
  end
end
