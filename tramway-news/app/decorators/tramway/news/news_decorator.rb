# frozen_string_literal: true

class Tramway::News::NewsDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end
  end

  def lead
    object.body.first 200
  end
end
