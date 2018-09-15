class Tramway::Event::EventsController < Tramway::Event::ApplicationController
  layout 'tramway/landing/application'

  def show
    @event = ::Tramway::Event::EventDecorator.decorate ::Tramway::Event::Event.find params[:id]
    class_name = "ParticipantExtendedFormEventId#{@event.id}"
    form_class = ::Tramway::Core::ExtendableForm.new(class_name, *@event.participant_form_fields.inputs_list.map(&:title).map(&:to_sym))
    @participant_form = form_class.new ::Tramway::Event::Participant.new
  end
end
