class Tramway::Core::ExtendableForm
  class << self
    def new(name, **more_properties)
      if Object.const_defined? name
        name.constantize
      else
        Object.const_set(name, Class.new(::Tramway::Core::ApplicationForm) do
          define_method 'submit' do |params|
            model.values ||= {}
            model.values = params.permit!.to_h.reduce({}) do |hash, pair|
              hash.merge! pair[0] => pair[1]
            end
            super params
          end

          define_method 'properties' do
            more_properties.reduce({}) do |hash, property|
              hash.merge! property[0] => {
                extended_form_property: property[1]
              }
            end
          end

          more_properties.each do |property|
            define_method property[0] do 
              model.values[property[0]] if model.values
            end
          end
        end)
      end
    end
  end
end
