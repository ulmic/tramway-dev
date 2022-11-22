# frozen_string_literal: true

class Admin::Tramway::Mailout::SessionForm < ::Tramway::ApplicationForm
  properties :campaign_id, :campaign_type, :mailing_state, :mailing_state_event
end
