# frozen_string_literal: true

module Tramway::Conference
  class Unity < ::Tramway::Core::ApplicationRecord
    has_many :social_networks, as: :record, class_name: 'Tramway::Profiles::SocialNetwork'

    include ::Tramway::Partner::Scopes
  end
end
