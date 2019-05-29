require 'securerandom'

class Tramway::Notify::RemindPasswordsController < Tramway::Notify::ApplicationController
  def create
    user = User.find_by email: params[:data][:attributes][:email]
    if user
      notification_form = ::Tramway::Notify::NotificationForm.new
      token = Token.create! uid: SecureRandom.hex, user_id: user.id, token_type: :remind_password
      if notification_form.submit title: I18n.t('notifications.remind_password.title'),
          body: I18n.t('notifications.remind_password.body', token: token.uid),
          receiver: params[:data][:attributes][:email],
          sender: 'PekloTool',
          notification_type: :unisender

        # Remove after testing
        UnisenderService.send_notification ::Tramway::Notify::Notification.create(
          receiver: user.email,
          body: I18n.t('notifications.remind_password.body', token: token.uid),
          title: I18n.t('notifications.remind_password.title'),
          sender: 'PekloTool',
          notification_type: :unisender
        )

        render json: user,
          serializer: UserSerializer,
          status: :created 
      else
        render_errors_for notification_form
      end
    else
      render_error_with_text I18n.t('.user_not_found')
    end
  end

  def update
    user_form = UserForm.new Token.find_by(uid: params[:data][:attributes][:uid]).user
    if user_form.submit password: params[:data][:attributes][:password]
      render json: user_form.model,
        serializer: UserSerializer,
        status: :ok
    else
      render_errors_for user_form
    end
  end
end
