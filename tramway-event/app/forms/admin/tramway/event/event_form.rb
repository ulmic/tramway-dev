# frozen_string_literal: true

class Admin::Tramway::Event::EventForm < ::Tramway::Core::ApplicationForm
  properties :title, :description, :begin_date, :end_date, :photo, :status,
    :request_collecting_begin_date, :request_collecting_end_date, :short_description

  def initialize(object)
    super(object).tap do
      form_properties title: :string,
                      short_description: :text,
                      description: :ckeditor,
                      begin_date: :date_picker,
                      end_date: :date_picker,
                      request_collecting_begin_date: :date_picker,
                      request_collecting_end_date: :date_picker,
                      photo: :file,
                      status: :default
    end
  end
end
