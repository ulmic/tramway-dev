class Tramway::Notify::NotificationsController < Tramway::Notify::ApplicationController
  def create
    notification_form = Tramway::Notify::NotificationForm.new Tramway::Notify::Notification.new
    if notification_form.submit params[:data][:attributes]
      "#{notification.notification_type.capitalize}Service".constantize.send_notification notification
      notification.deliveries.create! attempt: notification.deliveries.count + 1
    else
      head :bad_request
    end
  end
end
