# frozen_string_literal: true

class Tramway::SportSchool::TrainerForm < ::Tramway::Core::ApplicationForm
  properties :first_name, :last_name, :patronymic, :photo, :degree, :view_state_event, :description

  def initialize(object)
    super(object).tap do
      form_properties first_name: :string,
        last_name: :string,
        patronymic: :string,
        photo: :file,
        degree: :default,
        description: :text
    end
  end
end
