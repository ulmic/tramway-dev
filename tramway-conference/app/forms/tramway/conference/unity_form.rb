class Tramway::Conference::UnityForm < ::Tramway::Core::ApplicationForm
  properties :title, :tagline, :logo, :state, :phone, :address, :longtitude, :latitude

  def initialize(object)
    form_object = super object
    form_properties title: :string,
                    tagline: :string,
                    phone: :string,
                    address: :string,
                    latitude: :string,
                    longtitude: :string
    form_object
  end
end
