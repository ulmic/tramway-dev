class Tramway::Notify::Notification < Tramway::Notify::ApplicationRecord
  has_many :deliveries
end
