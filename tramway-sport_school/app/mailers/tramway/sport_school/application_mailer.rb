# frozen_string_literal: true

module Tramway
  module SportSchool
    class ApplicationMailer < ActionMailer::Base
      default from: 'from@example.com'
      layout 'mailer'
    end
  end
end
