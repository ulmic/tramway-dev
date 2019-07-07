class Tramway::Site::PersonForm < Tramway::Core::ExtendedApplicationForm
  properties :full_name, :photo, :short_bio, :bio

  def initialize(object)
    super(object).tap do
      form_properties full_name: :string,
        photo: :file,
        short_bio: :string,
        bio: :ckeditor
    end
  end

  def full_name=(value)
    model.names = value.split ' '
  end

  def full_name
    model.names.join ' '
  end
end
