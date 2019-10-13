# frozen_string_literal: true

require 'tramway/notify/engine'
require 'tramway/notify/sender'
require 'tramway/notify/generates/install_generator'

module Tramway
  module Notify
    class << self
      def create_and_send_notification(**params)
        notification = ::Tramway::Notify::Notification.create! params
        "#{notification.notification_type.capitalize}Service".constantize.send_notification notification
        notification.deliveries.create! attempt: notification.deliveries.count + 1
      end
    end
  end
end
