class Tramway::Event::PartakingForm < ::Tramway::Core::ApplicationForm
  properties :section_id, :person_id, :position
  associations :section, :person

  def initialize(object)
    super(object).tap do
      form_properties section: :association,
        person: :association,
        position: :string
    end
  end
end
