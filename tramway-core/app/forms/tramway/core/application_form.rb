# frozen_string_literal: true

module Tramway::Core
  class ApplicationForm < ::Reform::Form
    def initialize(object = nil)
      object ||= self.class.model_class.new
      super(object).tap do
        @@model_class = object.class
        @@enumerized_attributes = object.class.try :enumerized_attributes
        @@associations ||= []

        self.class.full_class_name_associations.each do |association, class_name|
          if class_name.is_a? Array
            self.class.send(:define_method, "#{association}=") do |value|
              association_class = send("#{association}_type")
              if association_class.nil?
                raise Tramway::Error.new(plugin: :core, method: :initialize, message: 'Polymorphic association class is nil. Maybe, you should write `assocation #{association_name}` after `properties #{association_name}_id, #{association_name}_type`')
              else
                super association_class.constantize.find value
              end
            end
          else
            self.class.send(:define_method, "#{association}=") do |value|
              super class_name.find value
            end
          end
        end

        delegating object
      end
    end

    def submit(params)
      if params
        save if validate params
      else
        error = Tramway::Error.new(plugin: :core, method: :submit, message: 'ApplicationForm::Params should not be nil')
        raise error.message
      end
    end

    def model_name
      @@model_class.model_name
    end

    def form_properties(**args)
      @form_properties = args
    end

    def properties
      @form_properties || []
    end

    def build_errors; end

    def delegating(object)
      methods = %i[to_key errors]
      methods.each do |method|
        self.class.send(:define_method, method) do
          object.send method
        end
      end
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

          if options
            if options[:polymorphic]
              hash.merge! association => @@model_class.send("#{association}_type").values
            else
              class_name = options[:class_name] || association.to_s.camelize
              hash.merge!(association => class_name.constantize)
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
        if defined?(@@model_class) && @@model_class
          @@model_class
        else
          model_class_name ||= name.to_s.sub(/Form$/, '')
          begin
            @@model_class = model_class_name.constantize
          rescue StandardError
            error = Tramway::Error.new(plugin: :core, method: :model_class, message: "There is not model class name for #{name}. Should be #{model_class_name} or you can use another class to initialize form object or just initialize form with object.")
            raise error.message
          end
        end
      end

      def validation_group_class
        ActiveModel
      end

      def validates(attribute, **options)
        model_class.validates attribute, **options
      end
    end
  end
end
