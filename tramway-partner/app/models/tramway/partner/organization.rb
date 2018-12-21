module Tramway
  module Partner
    class Organization < ::Tramway::Partner::ApplicationRecord
      has_many :partnerships, class_name: 'Tramway::Partner::Partnership'
    end
  end
end
