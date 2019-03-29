class CreateTramwayNotifyDeliveries < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_notify_deliveries do |t|
      t.integer :notification_id
      t.integer :attempt

      t.text :state, default: :active

      t.timestamps
    end
  end
end
