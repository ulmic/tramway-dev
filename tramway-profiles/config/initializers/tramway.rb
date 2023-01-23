# frozen_string_literal: true

Rails.application.config.after_initialize do
  Tramway.set_available_models(Tramway::Profiles::SocialNetwork, project: :profiles)
end
