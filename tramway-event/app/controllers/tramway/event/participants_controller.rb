class Tramway::Event::ParticipantsController < Tramway::Event::ApplicationController
  def create
    event = ::Tramway::Event::Event.find params[:tramway_event_participant][:event_id]
    class_name = "ParticipantExtendedFormEventId#{event.id}"
    form_class = ::Tramway::Core::ExtendableForm.new(class_name, *(event.participant_form_fields.inputs_list.map(&:title)).map(&:to_sym))
    @participant_form = form_class.new ::Tramway::Event::Participant.new event_id: event.id
    if @participant_form.submit params[:tramway_event_participant].except :event_id
      redirect_to event_path event, flash: :success
    else
      redirect_to event_path event, flash: :error
    end
  end
end
