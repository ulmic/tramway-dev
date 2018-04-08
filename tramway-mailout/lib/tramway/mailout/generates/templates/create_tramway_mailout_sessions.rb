class CreateTramwayMailoutSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_mailout_sessions do |t|
      t.integer :campaign_id
      t.text :state
      t.text :mailing_state, default: :ready
      t.text :campaign_type

      t.timestamps
    end
  end
end
