require 'tramway/error'

class Tramway::Core::ApplicationDecorator
  include ActionView::Helpers
  include ActionView::Context
  include ::FontAwesome::Rails::IconHelper

  def initialize(object)
    @object = object
  end

  def name
    object.try(:name) || object.try(:title) || title
  end

  def title
    error = Tramway::Error.new(plugin: :core, method: :title, message: ("Please, implement `title` method in a #{self.class} or #{object.class}"))
    raise error.message
  end

  class << self
    def list_attributes
      []
    end

    def show_attributes
      []
    end

    def decorate(object_or_array)
      if object_or_array.class.superclass == ActiveRecord::Relation
        decorated_array = object_or_array.map do |obj|
          new obj
        end
        Tramway::Core::ApplicationDecoratedCollection.new decorated_array, object_or_array
      else
        new object_or_array
      end
    end

    def decorate_association(association_name, decorator: nil)
      @@decorated_associations ||= []
      @@decorated_associations << association_name

      define_method association_name do
        class_name = object.class.reflect_on_association(association_name).options[:class_name]
        unless class_name
          error = Tramway::Error.new(plugin: :core, method: :decorate_association, message: ("Please, specify `#{association_name}` association class_name in #{object.class} model. For example: `has_many :#{association_name}, class_name: '#{association_name.to_s.singularize.camelize}'`"))
          raise error.message
        end

        object.send(association_name).active.map do |association_object|
          decorator_class_name = decorator || "#{class_name.singularize}Decorator".constantize
          decorator_class_name.decorate association_object
        end
      end
    end

    def model_class
      self.to_s.sub(/Decorator$/, '').constantize
    end

    def model_name
      model_class.try(:model_name)
    end
  end

  delegate :id, to: :object
  delegate :human_state_name, to: :object

  def link
    if object.try :file
      object.file.url
    else
      error = Tramway::Error.new(
        plugin: :core,
        method: :link,
        message: ("Method `link` uses `file` attribute of the decorated object. If decorated object doesn't contain `file`, you shouldn't use `link` method."))
      raise error.message
    end
  end

  def public_path; end

  def model
    object
  end

  def associations(associations_type)
    object.class.reflect_on_all_associations(associations_type).map do |association|
      association unless association.name == :audits
    end.compact
  end

  include Tramway::Core::Concerns::AttributesDecoratorHelper

  def attributes
    object.attributes.reduce({}) do |hash, attribute|
      value = try(attribute[0]) ? send(attribute[0]) : object.send(attribute[0])
      if attribute[0].to_s.in? object.class.state_machines.keys.map(&:to_s)
        hash.merge! attribute[0] => state_machine_view(object, attribute[0])
      elsif value.class.in? [ ActiveSupport::TimeWithZone, DateTime, Time ]
        hash.merge! attribute[0] => datetime_view(attribute[1])
      elsif value.class.superclass == ApplicationUploader
        tags = content_tag(:div) do
          if value.url.match(/jpg|JPG|png|PNG$/)
            concat image_tag value.try(:small) ? value.small.url : value.url
          end
          concat link_to(fa_icon(:download), value.url, class: 'btn btn-success')
        end
        hash.merge! attribute[0] => tags
      elsif value.is_a? Enumerize::Value
        hash.merge! attribute[0] => value.text
      else
        hash.merge! attribute[0] => value
      end
    end
  end

  def yes_no(boolean_attr)
    boolean_attr.to_s == 'true' ? I18n.t('helpers.yes') : I18n.t('helpers.no')
  end

  protected
  
  def object
    @object
  end
end 
