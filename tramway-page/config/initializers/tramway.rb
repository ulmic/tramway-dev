# frozen_string_literal: true

::Tramway::Admin.set_available_models(::Tramway::Page::Page, project: :page)
::Tramway::Admin.set_additional_buttons(
  {
    ::Tramway::Page::Page => {
      show: [
        lambda { |record|
          {
            url: Tramway::Page::Engine.routes.url_helpers.preview_path(id: record.id),
            method: :get,
            text: 'Preview',
            color: :primary
          }
        }
      ]
    }
  },
  project: :subberz
)
