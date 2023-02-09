# frozen_string_literal: true

Rails.application.config.after_initialize do
  Tramway.set_available_models([Tramway::News::News], project: :news)
  Tramway::Landing.head_content = lambda do
    stylesheet_link_tag 'tramway/news/application'
  end
end
