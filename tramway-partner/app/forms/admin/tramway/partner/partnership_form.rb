# frozen_string_literal: true

class Admin::Tramway::Partner::PartnershipForm < ::Tramway::ApplicationForm
  properties :partner_id, :organization_id, :partnership_type, :partner_type

  associations :partner, :organization

  def initialize(object)
    form_object = super object
    form_properties partner: :polymorphic_association,
                    organization: :association,
                    partnership_type: :default
    form_object
  end
end
