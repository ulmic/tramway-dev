::Tramway::User.root_path = '/admin'
#::Tramway::Admin.set_available_models ::Tramway::SportSchool::KindSport,
#                                      ::Tramway::SportSchool::Trainer,
#                                      ::Tramway::SportSchool::Document,
#                                      ::Tramway::SportSchool::Organization
::Tramway::Admin.set_singleton_models ::Tramway::Conference::Unity
::Tramway::Core.initialize_application model_class: ::Tramway::Conference::Unity
::Tramway::Profiles.records = [ ::Tramway::Conference::Unity ]
