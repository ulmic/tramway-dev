module Tramway::Notify::Sender
  class << self
    def send_now
      ::Tramway::Notify::Notification.active.ready.find_each do |notification|
        if notification.departure_date.nil? || notification.departure_date < DateTime.now
          "#{notification.notification_type.camelize}Service".constantize.send_notification notification
          notification.deliveries.create! attempt: notification.deliveries.count + 1
        end
      end
    end
  end
end
