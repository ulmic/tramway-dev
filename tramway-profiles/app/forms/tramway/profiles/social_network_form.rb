# frozen_string_literal: true

class Tramway::Profiles::SocialNetworkForm < ::Tramway::Core::ApplicationForm
  properties :title, :network_name, :record_id, :record_type, :uid

  def initialize(object)
    super(object).tap do
      form_properties title: :string,
        network_name: :default,
        uid: :string,
        record_type: :default,
        record_id: :integer
    end
  end
end
