# frozen_string_literal: true

class Tramway::Profiles::SocialNetworkForm < ::Tramway::Core::ApplicationForm
  properties :title, :network_name, :record_id, :record_type, :uid

  def initialize(object)
    form_object = super object
    form_properties title: :string,
                    network_name: :default,
                    record_id: :integer,
                    record_type: :default,
                    uid: :string
    form_object
  end
end
