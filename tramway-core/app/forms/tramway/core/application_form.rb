module Tramway::Core
  class ApplicationForm < ::Reform::Form
    def initialize(object)
      super(object).tap do
        @@model_class = object.class
        @@enumerized_attributes = object.class.enumerized_attributes
        @@associations ||= []

        self.class.full_class_name_associations.each do |association, class_name|
          if class_name.is_a? Array
            self.class.send(:define_method, "#{association}=") do |value|
              association_class = send("#{association}_type")
              super association_class.constantize.find value
            end
          else
            self.class.send(:define_method, "#{association}=") do |value|
              super class_name.find value
            end
          end
        end
      end
    end

    def submit(params)
      if params
        save if validate params
      else
        error = Tramway::Error.new(plugin: :core, method: :title, message: ('ApplicationForm::Params should not be nil'))
        raise error.message
      end
    end

    def form_properties(**args)
      @form_properties = args
    end

    def properties
      @form_properties || []
    end

    def build_errors; end

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
          
          if options
            if options[:polymorphic]
              hash.merge! association => @@model_class.send("#{association}_type").values
            else
              hash.merge!(association => options[:class_name].constantize)
            end
          end
          hash
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
