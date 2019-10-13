# frozen_string_literal: true

class AddPhotoToTramwayEventEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :tramway_event_events, :photo, :text
  end
end
