# frozen_string_literal: true

class Admin::Tramway::Notify::NotificationForm < Tramway::Core::ApplicationForm
  properties :title,
    :body,
    :sender,
    :receiver,
    :notification_type,
    :departure_date,
    :state,
    :departure_state_event,
    :action
end
