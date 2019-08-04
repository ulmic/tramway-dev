class Tramway::Core::ExtendableForm
  class << self
    def new(name, simple_properties: {}, **more_properties)
      if Object.const_defined? name
        name.constantize
      else
        Object.const_set(name, Class.new(::Tramway::Core::ApplicationForm) do
          properties(*simple_properties.keys) if simple_properties.keys.any?

          define_method 'submit' do |params|
            model.values ||= {}
            extended_params = params.except(*simple_properties.keys)
            params.each do |key, value|
              method_name = "#{key}="
              if respond_to?(method_name)
                send method_name, value
              end
            end
            model.values = extended_params.permit!.to_h.reduce(model.values) do |hash, pair|
              hash.merge! pair[0] => pair[1]
            end
            super params
          end

          define_method 'properties' do
            hash = simple_properties.reduce({}) do |h, property|
              unless model.class.state_machines.keys.include?(property[0])
                h.merge! property[0] => property[1]
              end
              h
            end
            more_properties.reduce(hash) do |h, property|
              h.merge! property[0] => {
                extended_form_property: property[1][:object]
              }
            end
          end

          more_properties.each do |property|
            define_method property[0] do 
              model.values[property[0]] if model.values
            end

            if property[1][:validates].present?
              define_method "#{property[0]}=" do |value|
                property[1][:validates].each do |pair|
                  validator_object = "#{pair[0].camelize}Validator".constantize.new({ attributes: :not_blank })
                  if pair[1] == 'true' && !validator_object.send(:valid?, value)
                    model.errors.add property[0],
                      I18n.t("activerecord.errors.models.#{model.class.name.underscore}.attributes.#{property[0]}.#{pair[0]}", { value: value })
                  end
                end
              end
            end
          end
        end)
      end
    end
  end
end
