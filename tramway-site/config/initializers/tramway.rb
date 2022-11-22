# frozen_string_literal: true

::Tramway::Admin.set_singleton_models ::Tramway::Site::Person, project: :site
::Tramway.initialize_application model_class: ::Tramway::Site::Person
