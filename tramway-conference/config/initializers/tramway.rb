# frozen_string_literal: true

Rails.application.config.after_initialize do
  Tramway.root_path_for Tramway::User => '/admin'
  Tramway.set_singleton_models Tramway::Conference::Unity, project: :conference
  Tramway.set_available_models(
    [
      Tramway::Event::Event,
      Tramway::Event::ParticipantFormField,
      Tramway::Event::Participant,
      Tramway::Event::Section,
      Tramway::Event::Person,
      Tramway::Event::Partaking,
      Tramway::Event::Place,
      Tramway::Event::Action,
      Tramway::User,
      Tramway::Profiles::SocialNetwork
    ],
    project: :conference
  )
  Tramway.initialize_application model_class: Tramway::Conference::Unity
  Tramway::Landing.head_content = lambda do
    concat stylesheet_link_tag    'tramway/conference/application', media: 'all'
    concat javascript_include_tag 'tramway/conference/application'
  end
end
