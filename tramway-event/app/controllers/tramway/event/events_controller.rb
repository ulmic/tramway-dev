class Tramway::Event::EventsController < Tramway::Event::ApplicationController
  layout 'tramway/landing/application'

  def show
    @event = ::Tramway::Event::EventDecorator.decorate ::Tramway::Event::Event.find params[:id]
    class_name = "ParticipantExtendedForm#{request.uuid.gsub('-', '')}"
    form_class = ::Tramway::Core::ExtendableForm.new(class_name, *@event.participant_form_fields.inputs_list.map(&:title).map(&:to_sym))
    @participant_form = form_class.new ::Tramway::Event::Participant.new
    @sections_as_features = @event.sections.order(position: :asc).map { |s| ::Tramway::Event::SectionFeatureDecorator.decorate s }
    @sections = @event.sections.order(position: :asc).map { |s| ::Tramway::Event::SectionDecorator.decorate s }
  end
end
