# frozen_string_literal: true

class Admin::Tramway::SportSchool::InstitutionForm < ::Tramway::Core::ApplicationForm
  properties :title, :tagline, :logo, :state, :phone, :address, :longtitude, :latitude, :url, :found_date

  def initialize(object)
    super(object).tap do
      form_properties title: :string,
                      tagline: :string,
                      phone: :string,
                      address: :string,
                      latitude: :string,
                      longtitude: :string,
                      url: :string,
                      found_date: :date_picker
    end
  end
end
