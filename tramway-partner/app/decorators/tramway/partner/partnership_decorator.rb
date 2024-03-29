# frozen_string_literal: true

class Tramway::Partner::PartnershipDecorator < ::Tramway::ApplicationDecorator
  class << self
    def collections
      [:all]
    end
  end

  def title
    "#{object.organization.title} #{I18n.t("enumerize.tramway/partner/partnership.partnership_type.#{object.partnership_type}")} #{object.partner.title}"
  end
end
