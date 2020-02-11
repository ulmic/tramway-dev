# frozen_string_literal: true

class Admin::Tramway::SportSchool::KindSportForm < ::Tramway::Core::ApplicationForm
  properties :title, :view_state, :image, :description

  def initialize(object)
    super(object).tap do
      form_properties title: :string, image: :file, description: :default
    end
  end
end
