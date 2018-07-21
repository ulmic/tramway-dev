::Tramway::User.root_path = '/admin'
::Tramway::Admin.set_singleton_models(::Tramway::Conference::Unity, project: :conference)
::Tramway::Profiles.records = [ ::Tramway::Conference::Unity ]
