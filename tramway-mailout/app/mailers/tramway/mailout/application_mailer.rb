module Tramway
  module Mailout
    class ApplicationMailer < ActionMailer::Base
      def just_message(receiver_email, sender_email, title, body)
        @body = body
        mail from: sender_email, to: receiver_email, subject: title
      end
    end
  end
end
