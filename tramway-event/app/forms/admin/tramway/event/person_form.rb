# frozen_string_literal: true

class Admin::Tramway::Event::PersonForm < ::Tramway::Core::ApplicationForm
  properties :first_name, :last_name, :photo, :description

  def initialize(object)
    super(object).tap do
      form_properties first_name: :string,
                      last_name: :string,
                      photo: :file,
                      description: :ckeditor
    end
  end
end
