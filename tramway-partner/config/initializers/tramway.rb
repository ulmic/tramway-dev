# frozen_string_literal: true

::Tramway::Admin.set_available_models(
  ::Tramway::Partner::Organization,
  ::Tramway::Partner::Partnership,
  project: :partner
)
