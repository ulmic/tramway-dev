# frozen_string_literal: true

class AddPositionToTramwayEventSections < ActiveRecord::Migration[5.1]
  def change
    add_column :tramway_event_sections, :position, :integer
  end
end
