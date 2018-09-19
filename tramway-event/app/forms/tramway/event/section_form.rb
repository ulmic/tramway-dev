class Tramway::Event::SectionForm < ::Tramway::Core::ApplicationForm
  properties :event, :title, :description, :photo, :icon
  association :event

  def initialize(object)
    super(object).tap do
      form_properties title: :string,
                      description: :ckeditor,
                      event: :association,
                      photo: :file,
                      icon: :string
    end       
  end
end
