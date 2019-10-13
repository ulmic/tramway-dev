# frozen_string_literal: true

::Tramway::Admin.set_singleton_models ::Tramway::Site::Person, project: :site
::Tramway::Core.initialize_application model_class: ::Tramway::Site::Person
