# frozen_string_literal: true

module Tramway::Admin::AdditionalButtons
  def set_additional_buttons(buttons, project:)
    @additional_buttons ||= {}
    @additional_buttons[project] ||= {}
    @additional_buttons[project].merge! buttons
  end

  def additional_buttons(view: nil, record: nil, project: nil)
    @additional_buttons&.dig record, view
  end
end
