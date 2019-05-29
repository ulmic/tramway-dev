class Tramway::Core::ExtendedApplicationForm < Tramway::Core::ApplicationForm
  class << self
    def properties(*args)
      @@extendable_properties = args
      super *args
    end
  end

    def initialize(model)
      @@extendable_properties.each do |prop|
        unless model.respond_to? prop
          model.class.define_method prop do
          end
          model.class.define_method "#{prop}=" do |value|
          end
        end
      end
      super
    end
end
