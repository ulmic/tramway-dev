# frozen_string_literal: true

class Tramway::Event::Partaking < ::Tramway::Core::ApplicationRecord
  belongs_to :part, polymorphic: true
  enumerize :part_type, in: ['Tramway::Event::Event', 'Tramway::Event::Section']

  belongs_to :person, class_name: 'Tramway::Event::Person'

  search_by :position, person: %i[first_name last_name description]
end
