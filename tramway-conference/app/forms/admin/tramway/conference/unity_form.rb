# frozen_string_literal: true

class Admin::Tramway::Conference::UnityForm < ::Tramway::ApplicationForm
  properties :title, :tagline, :logo, :state, :phone, :address, :longtitude, :latitude, :url, :found_date, :email,
    :favicon, :public_name

  def initialize(object)
    super(object).tap do
      form_properties title: :string,
                      tagline: :string,
                      phone: :string,
                      address: :string,
                      latitude: :string,
                      longtitude: :string,
                      url: :string,
                      found_date: :date_picker,
                      email: :string,
                      favicon: :file,
                      public_name: :string
    end
  end
end
