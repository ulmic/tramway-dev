class Tramway::Core::ExtendedApplicationForm < Tramway::Core::ApplicationForm
  class << self
    def properties(*args)
      @@extendable_properties = args
      super(*args)
    end

    def new(model)
      @@extendable_properties.each do |prop|
        unless model.try prop
          model.class.define_method prop do
          end
          model.class.define_method "#{prop}=" do |value|
          end
        end
      end
      super
    end
  end
end
