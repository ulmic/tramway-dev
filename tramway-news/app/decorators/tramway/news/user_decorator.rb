# frozen_string_literal: true

class ::Tramway::News::UserDecorator < ::Tramway::ApplicationDecorator
  def short_name
    "#{object.first_name} #{object.last_name}"
  end
end
