module Tramway::ClassNameHelpers
  def model_class_name(class_name)
    class_name.constantize
  end

  def decorator_class_name(class_name = -> { model_class })
    "#{class_name}Decorator".constantize
  end

  def form_class_name(class_name = -> { model_class })
    "#{class_name}Form".constantize
  end
end
