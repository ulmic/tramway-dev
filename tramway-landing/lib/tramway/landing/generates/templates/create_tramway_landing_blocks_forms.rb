# frozen_string_literal: true

class CreateTramwayLandingBlocksForms < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_landing_blocks_forms do |t|
      t.integer :block_id
      t.integer :form_id
      t.text :state

      t.timestamps
    end
  end
end
