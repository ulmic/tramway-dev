module Tramway::Core::Concerns::AttributesDecoratorHelper
  def datetime_view(value)
    I18n.l value
  end

  def state_machine_view(object, attribute_name)
    object.send "human_#{attribute_name}_name"
  end
end
