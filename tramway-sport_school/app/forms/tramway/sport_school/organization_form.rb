# frozen_string_literal: true

class Tramway::SportSchool::OrganizationForm < ::Tramway::Core::ApplicationForm
  properties :title, :description, :logo, :organization_type, :state, :view_state, :link

  def initialize(object)
    form_object = super object
    form_properties title: :string,
                    description: :default,
                    organization_type: :default,
                    logo: :file,
                    link: :string
    form_object
  end
end
