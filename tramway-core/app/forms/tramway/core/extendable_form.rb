class Tramway::Core::ExtendableForm
  class << self
    def new(name, *more_properties)
      if Object.const_defined? name
        name.constantize
      else
        Object.const_set(name, Class.new(::Tramway::Core::ApplicationForm) do
          define_method 'submit' do |params|
            model.values ||= {}
            model.values = params.permit!.to_h.reduce({}) do |hash, attribute, value|
              hash.merge! attribute => value
            end
            super params
          end

          more_properties.each do |property|
            define_method property do 
              model.values[property] if model.values
            end
          end
        end)
      end
    end
  end
end
