class Tramway::Conference::PersonForm < ::Tramway::Core::ApplicationForm
  properties :first_name, :last_name, :photo, :sections

  def initialize(object)
    super(object).tap do
      form_properties first_name: :string,
        last_name: :string,
        photo: :file,
        sections: :selectize
    end
  end

  def sections=(value)
  end
end
