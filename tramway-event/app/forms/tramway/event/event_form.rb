class Tramway::Event::EventForm < ::Tramway::Core::ApplicationForm
  properties :title, :description, :begin_date, :end_date

  def initialize(object)
    form_object = super object
    form_properties title: :string,
                    description: :ckeditor,
                    begin_date: :default,
                    end_date: :default
    form_object
  end
end
