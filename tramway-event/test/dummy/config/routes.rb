Rails.application.routes.draw do
  mount Tramway::Event::Engine => "/tramway-event"
end
