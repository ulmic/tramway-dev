# frozen_string_literal: true

class Admin::Tramway::SportSchool::DocumentForm < ::Tramway::ApplicationForm
  properties :title, :file, :view_state_event, :document_type

  def initialize(object)
    super(object).tap do
      form_properties title: :string, file: :file, document_type: :default
    end
  end
end
