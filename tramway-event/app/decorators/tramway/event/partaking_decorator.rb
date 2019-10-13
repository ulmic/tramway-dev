# frozen_string_literal: true

class Tramway::Event::PartakingDecorator < ::Tramway::Core::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def show_attributes
      %i[part_name event_duration part_description]
    end
  end

  decorate_association :part

  def name
    "#{object.person.first_name} #{object.person.last_name} - #{object.position}"
  end

  def part_name
    part.name
  end

  def event_duration
    if part.respond_to? :duration
      part.duration
    else
      part.event.duration
    end
  end

  def part_description
    raw part.respond_to?(:description) ? part.description : part.event.description
  end
end
