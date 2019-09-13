class Tramway::Event::PlaceForm < Tramway::Core::ApplicationForm
  properties :title, :description, :coordinates, :photo, :city

  def initialize(object)
    super(object).tap do
      form_properties title: :string,
        description: :ckeditor,
        coordinates: :string,
        photo: :file,
        city: :string
    end
  end
end
