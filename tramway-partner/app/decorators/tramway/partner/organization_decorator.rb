class Tramway::Partner::OrganizationDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [ :all ]
    end
  end
end
