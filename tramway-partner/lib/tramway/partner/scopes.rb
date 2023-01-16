# frozen_string_literal: true

module Tramway::Partner::Scopes
  extend ActiveSupport::Concern

  included do
    Tramway::Partner::Partnership.partnership_type.values.each do |partnership_type|
      define_method partnership_type.pluralize.to_sym do
        query = <<-SQL
        tramway_partner_partnerships.partnership_type = '#{partnership_type}'
        AND tramway_partner_partnerships.partner_id = '#{id}'
        AND tramway_partner_partnerships.partner_type = '#{self.class.name}'
        SQL
        Tramway::Partner::Organization.joins(:partnerships).where(query)
      end
    end
  end
end
