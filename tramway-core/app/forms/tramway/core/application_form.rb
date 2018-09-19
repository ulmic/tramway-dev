module Tramway::Core
  class ApplicationForm < ::Reform::Form
    def initialize(object)
      super(object).tap do
        @@associations&.each do |association|
          class_name = object.class.reflect_on_all_associations(:belongs_to).select do |a|
            a.name == association.to_sym
          end.first.options[:class_name].constantize

          self.class.send(:define_method, "#{association}=") do |value|
            super class_name.find value
          end
        end
      end
    end

    def submit(params)
      raise 'ApplicationForm::Params should not be nil'.inspect unless params
      save if validate params
    end

    def form_properties(**args)
      @form_properties = args
    end

    def properties
      @form_properties
    end

    class << self
      def association(property)
        properties property
        @@associations ||= []
        @@associations << property
      end
    end
  end
end
