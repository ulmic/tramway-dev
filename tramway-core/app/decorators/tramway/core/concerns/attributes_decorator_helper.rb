module Tramway::Core::Concerns::AttributesDecoratorHelper
  def date_view(value)
    I18n.l value.to_date if value
  end

  def datetime_view(value)
    I18n.l value if value
  end

  def state_machine_view(object, attribute_name)
    object.send "human_#{attribute_name}_name"
  end
end
