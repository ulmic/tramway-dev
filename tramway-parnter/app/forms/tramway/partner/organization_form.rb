class Tramway::Event::EventForm < ::Tramway::Core::ApplicationForm
  properties :title, :description, :begin_date, :end_date, :photo, :status,
    :request_collecting_begin_date, :request_collecting_end_date

  def initialize(object)
    form_object = super object
    form_properties title: :string,
                    description: :ckeditor,
                    begin_date: :date_picker,
                    end_date: :date_picker,
                    request_collecting_begin_date: :date_picker,
                    request_collecting_end_date: :date_picker,
                    photo: :file,
                    status: :default
    form_object
  end
end
