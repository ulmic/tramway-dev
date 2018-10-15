class Tramway::Event::PartakingForm < ::Tramway::Core::ApplicationForm
  properties :part_id, :part_type, :person_id, :position
  associations :person, :part

  def initialize(object)
    super(object).tap do
      form_properties part: :polymorphic_association,
        person: :association,
        position: :string
    end
  end
end
