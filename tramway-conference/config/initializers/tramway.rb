# frozen_string_literal: true

::Tramway::Auth.root_path = '/admin'
::Tramway::Admin.set_singleton_models ::Tramway::Conference::Unity, project: :conference
::Tramway::Admin.set_available_models ::Tramway::User::User, project: :conference
::Tramway::Profiles.records = [::Tramway::Conference::Unity]
::Tramway::Core.initialize_application model_class: ::Tramway::Conference::Unity
