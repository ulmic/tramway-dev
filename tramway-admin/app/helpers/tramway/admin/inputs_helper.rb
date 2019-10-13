# frozen_string_literal: true

module Tramway
  module Admin
    module InputsHelper
      def association_params(form_object:, property:, value:, object:)
        full_class_name_association = form_object.class.full_class_name_association(property)
        unless full_class_name_association
          raise "It seems you\'ve defined association attributes with `property` method. Please, use `association` method. `association :#{property}`"
        end

        {
          label: false,
          input_html: {
            name: "#{object}[#{property}]",
            id: "#{object}_#{property}",
            value: (form_object.send(property) || form_object.model.send("#{property}_id") || value)
          },
          selected: (form_object.model.send("#{property}_id") || value),
          collection: full_class_name_association.active.map do |obj|
            decorator_class(full_class_name_association).decorate obj
          end.sort_by(&:name)
        }
      end

      def polymorphic_association_params(object:, form_object:, property:, value:)
        full_class_names = form_object.model.class.send("#{property}_type").values.map &:constantize
        collection = full_class_names.map do |class_name|
          class_name.active.map do |obj|
            decorator_class(class_name).decorate obj
          end
        end.flatten.sort_by { |obj| obj.name.to_s }
        {
          as: :select,
          label: false,
          input_html: {
            name: "#{object}[#{property}]",
            id: "#{object}_#{property}",
            value: (form_object.send(property) || form_object.model.send("#{property}_id") || value)
          },
          selected: (form_object.model.send("#{property}_id") || value),
          collection: collection,
          label_method: lambda do |obj|
            "#{obj.class.model_name.human} | #{obj.name}"
          end
        }
      end

      def value_from_params(model_class:, property:, type:)
        if type.is_a? Symbol
          case type
          when :polymorphic_association
            {
              id: params.dig(model_class.to_s.underscore, property.to_s),
              type: params.dig(model_class.to_s.underscore, "#{property}_type")
            }
          else
            params.dig(model_class.to_s.underscore, property.to_s)
          end
        else
          params.dig(model_class.to_s.underscore, property.to_s)
        end
      end
    end
  end
end
