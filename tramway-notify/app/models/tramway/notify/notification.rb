class Tramway::Notify::Notification < Tramway::Notify::ApplicationRecord
  has_many :deliveries

  scope :ready, -> { where departure_state: :ready }
end
