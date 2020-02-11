# frozen_string_literal: true

class Admin::Tramway::Event::SectionForm < ::Tramway::Core::ApplicationForm
  properties :event, :title, :description, :photo, :icon, :position
  association :event

  def initialize(object)
    super(object).tap do
      form_properties title: :string,
                      description: :ckeditor,
                      event: :association,
                      photo: :file,
                      icon: :string,
                      position: :numeric
    end
  end
end
