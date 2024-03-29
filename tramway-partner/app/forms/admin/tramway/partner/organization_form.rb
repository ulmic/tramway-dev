# frozen_string_literal: true

class Admin::Tramway::Partner::OrganizationForm < ::Tramway::ApplicationForm
  properties :title, :logo, :url

  def initialize(object)
    form_object = super object
    form_properties title: :string,
                    logo: :file,
                    url: :string
    form_object
  end
end
