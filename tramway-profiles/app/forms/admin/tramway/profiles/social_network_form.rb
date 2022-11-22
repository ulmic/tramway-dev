# frozen_string_literal: true

class Admin::Tramway::Profiles::SocialNetworkForm < ::Tramway::ApplicationForm
  properties :title, :network_name, :uid, :record_id, :record_type

  association :record

  def initialize(object)
    super(object).tap do
      form_properties title: :string,
                      network_name: :default,
                      uid: :string,
                      record: :polymorphic_association
    end
  end
end
