# frozen_string_literal: true

::Tramway::Admin.set_available_models(::Tramway::Event::Event,
  ::Tramway::Event::ParticipantFormField,
  ::Tramway::Event::Participant,
  ::Tramway::Event::Section,
  ::Tramway::Event::Person,
  ::Tramway::Event::Partaking,
  ::Tramway::Event::Place,
  project: :event)
::Tramway::Admin.set_notificable_queries new_participants: -> { ::Tramway::Event::Participant.active.where(participation_state: :requested) }
