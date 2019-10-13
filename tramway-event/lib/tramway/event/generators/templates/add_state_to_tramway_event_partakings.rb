# frozen_string_literal: true

class AddStateToTramwayEventPartakings < ActiveRecord::Migration[5.1]
  def change
    add_column :tramway_event_partakings, :state, :text
  end
end
