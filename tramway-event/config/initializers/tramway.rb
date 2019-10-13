# frozen_string_literal: true

::Tramway::Admin.set_available_models(::Tramway::Event::Event,
                                      ::Tramway::Event::ParticipantFormField,
                                      ::Tramway::Event::Participant,
                                      ::Tramway::Event::Section,
                                      ::Tramway::Event::Person,
                                      ::Tramway::Event::Partaking,
                                      ::Tramway::Event::Place,
                                      project: :event)
