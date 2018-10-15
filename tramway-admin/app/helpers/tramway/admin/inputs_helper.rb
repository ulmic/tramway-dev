module Tramway
  module Admin
    module InputsHelper
      def association_params(form_object:, property:, value:, object:)
        full_class_name_association = form_object.class.full_class_name_association(property)
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
          end
        }
      end

      def polymorphic_association_params(object:, form_object:, property:, value:)
        full_class_names = form_object.model.class.send("#{property}_type").values.map &:constantize
        collection = full_class_names.map do |class_name|
          class_name.active.map do |obj|
            decorator_class(class_name).decorate obj
          end
        end.flatten
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
    end
  end
end
