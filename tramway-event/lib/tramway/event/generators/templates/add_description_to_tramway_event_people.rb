# frozen_string_literal: true

class AddDescriptionToTramwayEventPeople < ActiveRecord::Migration[5.1]
  def change
    add_column :tramway_event_people, :description, :text
  end
end
