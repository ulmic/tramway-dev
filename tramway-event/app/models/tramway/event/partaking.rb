class Tramway::Event::Partaking < ::Tramway::Core::ApplicationRecord
  belongs_to :section, class_name: 'Tramway::Event::Section'
  belongs_to :person, class_name: 'Tramway::Event::Person'
end
