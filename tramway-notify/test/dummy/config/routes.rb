Rails.application.routes.draw do
  mount Tramway::Notify::Engine => "/tramway-notify"
end
