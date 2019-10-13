# frozen_string_literal: true

class AddButtonToTramwayLandingBlocks < ActiveRecord::Migration[5.1]
  def change
    add_column :tramway_landing_blocks, :button, :jsonb
  end
end
