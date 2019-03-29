class Tramway::Notify::Delivery < Tramway::Notify::ApplicationRecord
  belongs_to :notification, class_name: 'Tramway::Notify::Notification'
end
