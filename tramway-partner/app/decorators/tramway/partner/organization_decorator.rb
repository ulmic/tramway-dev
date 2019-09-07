class Tramway::Partner::OrganizationDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end
  end

  decorate_association :partnerships

  delegate :title, to: :object
end
