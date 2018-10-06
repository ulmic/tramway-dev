module Tramway::Core
  class ApplicationForm < ::Reform::Form
    def initialize(object)
      super(object).tap do
        @@model_class = object.class
        @@enumerized_attributes = object.class.enumerized_attributes

        self.class.full_class_name_associations.each do |association, class_name|
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
      @form_properties || []
    end

    class << self
      delegate :defined_enums, to: :model_class

      def association(property)
        properties property
        @@associations ||= []
        @@associations << property
      end

      def associations(*properties)
        properties.each do |property|
          association property
        end
      end

      def full_class_name_associations
        @@associations&.reduce({}) do |hash, association|
          options = @@model_class.reflect_on_all_associations(:belongs_to).select do |a|
            a.name == association.to_sym
          end.first&.options
          
          options ? hash.merge!(association => options[:class_name].constantize) : hash
        end
      end

      def full_class_name_association(association_name)
        full_class_name_associations[association_name]
      end
      
      def enumerized_attributes
        @@enumerized_attributes
      end

      def reflect_on_association(*args)
        @@model_class.reflect_on_association(*args)
      end

      def model_class
        @@model_class ||= self.name.to_s.sub(/Form$/, '')
      end
    end
  end
end
