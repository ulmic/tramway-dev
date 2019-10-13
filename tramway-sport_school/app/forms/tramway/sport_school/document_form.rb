# frozen_string_literal: true

class Tramway::SportSchool::DocumentForm < ::Tramway::Core::ApplicationForm
  properties :title, :file, :view_state, :document_type

  def initialize(object)
    form_object = super object
    form_properties title: :string, file: :file, document_type: :default
    form_object
  end
end
