class Tramway::Conference::PersonForm < ::Tramway::Core::ApplicationForm
  properties :first_name, :last_name, :photo

  def initialize(object)
    super(object).tap do
      form_properties first_name: :string,
        last_name: :string,
        photo: :file
    end
  end
end
