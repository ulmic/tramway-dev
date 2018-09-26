::Tramway::User.root_path = '/admin'
::Tramway::Admin.set_singleton_models(::Tramway::Conference::Unity, project: :conference)
::Tramway::Admin.set_available_models(
  ::Tramway::User::User,
  ::Tramway::Conference::Person,
  project: :conference
)
::Tramway::Profiles.records = [ ::Tramway::Conference::Unity ]
::Tramway::Core.initialize_application model_class: ::Tramway::Conference::Unity
