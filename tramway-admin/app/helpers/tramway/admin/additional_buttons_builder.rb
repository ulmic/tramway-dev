module Tramway::Admin::AdditionalButtonsBuilder
  def build_buttons(additional_buttons)
    if additional_buttons
      additional_buttons = additional_buttons.is_a?(Hash) ? [ additional_buttons ] : additional_buttons
      additional_buttons.each do |button|
        concat(
          link_to(
            send(
              "#{button[:action]}_record_path",
              build_params(button[:params]).merge(model: button[:model_name])
            ),
            class: "btn btn-#{button_color(button[:action])} btn-xs"
          ) do
            button[:text] || button_icon(button[:action])
          end
        )
      end
    end
    return
  end

  private

  BUTTON_STYLES = {
    new: { color: :success, icon: :plus },
    create: { color: :success, icon: :plus },
    edit: { color: :warning, icon: :pencil },
    update: { color: :warning, icon: :pencil },
    delete: { color: :danger, icon: :remove }
  }

  def button_color(action)
    BUTTON_STYLES[action][:color]
  end

  def button_icon(action)
    BUTTON_STYLES[action][:icon]
  end

  def build_params(params)
    param = {}
    record = @record || @singleton
    params.each do |model_name, model_attributes|
      attributes = {}
      model_attributes.each do |name, value|
        if value.is_a? Proc
          value = record.model.instance_exec(&value)
        end
        attributes.merge! name => value
      end
      param.merge! model_name => attributes
    end
    param
  end
end
