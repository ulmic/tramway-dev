# frozen_string_literal: true

class Admin::Tramway::SportSchool::OrganizationForm < ::Tramway::Core::ApplicationForm
  properties :title, :description, :logo, :organization_type, :state, :view_state_event, :link

  def initialize(object)
    super(object).tap do
      form_properties title: :string,
                      description: :default,
                      organization_type: :default,
                      logo: :file,
                      link: :string
    end
  end
end
