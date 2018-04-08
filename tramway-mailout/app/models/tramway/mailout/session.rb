require 'tramway/mailout/job_proxy'

module Tramway::Mailout
  class Session < ::Tramway::Core::ApplicationRecord
    belongs_to :campaign, polymorphic: true

    state_machine :mailing_state, initial: :ready, namespace: :mailing do
      state :during
      state :completed
      state :aborted

      event :start do
        transition ready: :during
      end

      event :repeat do
        transition completed: :ready
      end

      event :abort do
        transition during: :aborted
      end

      event :continue do
        transition aborted: :during
      end

      after_transition ready: :during do
      end

      after_transition aborted: :during do |session|
        ::Tramway::Mailout::JobProxy.perform_job ::Tramway::Mailout::MailingJob,
          :now,
          session.campaign.contacts,
          session.campaign.strategy.touches.first.mail_template,
          ::Tramway::Mailout::ApplicationMailer,
          session.campaign.sender_email
      end
    end

    scope :during, -> { active.where mailing_state: :during }
  end
end
