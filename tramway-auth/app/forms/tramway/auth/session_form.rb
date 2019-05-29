module Tramway::Auth
  class SessionForm < ::Tramway::Core::ApplicationForm
    properties :email
    attr_accessor :password 

    def model_name
      User
    end

    def validate(params)
      begin
        add_wrong_email_or_password_error unless self.model.authenticate params[:password]
      rescue
        add_wrong_email_or_password_error
        false
      end
    end

    private

    def add_wrong_email_or_password_error
      errors.add(:email, I18n.t('errors.wrong_email_or_password'))
    end
  end
end
