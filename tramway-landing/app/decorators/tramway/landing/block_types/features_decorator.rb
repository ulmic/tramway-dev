# frozen_string_literal: true

class Tramway::Landing::BlockTypes::FeaturesDecorator < ::Tramway::ApplicationDecorator
  def icon; end

  def image; end

  def title; end

  def text; end

  def anchor; end

  def full_text; end

  def external_link; end

  def active_link
    if anchor.present?
      "##{anchor}"
    else
      if external_link.present?
        if external_link.match?(%r{^https?://})
          external_link
        else
          "http://#{external_link}"
        end
      else
        ''
      end
    end
  end
end
