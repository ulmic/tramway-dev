class AddWelcomeMessageToTramwayEventEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :tramway_event_events, :welcome_message, :text
  end
end
