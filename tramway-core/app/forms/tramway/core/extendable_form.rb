class Tramway::Core::ExtendableForm
  class << self
    def new(name, *more_properties)
      Object.const_set(name, Class.new(::Tramway::Core::ApplicationForm) do
        more_properties.each do |property|

          define_method property do 
            model.values[property] if model.values
          end

          define_method "#{property}=" do |value|
            model.values ||= {}
            model.values.merge! property => value
          end

        end
      end)
    end
  end
end
