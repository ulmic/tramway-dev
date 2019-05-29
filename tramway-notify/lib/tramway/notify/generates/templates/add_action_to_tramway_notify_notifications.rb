class AddActionToTramwayNotifyNotifications < ActiveRecord::Migration[5.1]
  add_column :tramway_notify_notifications, :action_name, :text
end
