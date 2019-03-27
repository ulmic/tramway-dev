class CreateTramwayNotifyNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :tramway_notify_notifications do |t|
      t.text :title
      t.text :body
      t.text :sender
      t.text :receiver

      t.datetime :departure_date

      t.text :state, default: :active
      t.text :departure_state, default: :ready

      t.timestamps
    end
  end
end
