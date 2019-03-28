module Tramway::Notify::Sender
  class << self
    def send_now
      ::Tramway::Notify::Notification.active.ready.find_each do |notification|
        if notification.departure_date.nil? || notification.departure_date < DateTime.now
          "#{notification.notification_type.capitalize}Service".constantize.send_notification
        end
      end
    end
  end
end
