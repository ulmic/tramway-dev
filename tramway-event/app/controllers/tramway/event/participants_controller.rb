# frozen_string_literal: true

class Tramway::Event::ParticipantsController < Tramway::Event::ApplicationController
  def create
    event = ::Tramway::Event::Event.find params[:tramway_event_participant][:event_id]
    @participant_form = ::Tramway::Event::ParticipantExtendedFormCreator.create_form_class(request.uuid, event).new ::Tramway::Event::Participant.new event_id: event.id
    if @participant_form.submit params[:tramway_event_participant].except :event_id
      redirect_to event_path event, flash: :success
    else
      redirect_to event_path event, flash: :error, errors: @participant_form.errors.messages, participant: @participant_form.attributes
    end
  end
end
