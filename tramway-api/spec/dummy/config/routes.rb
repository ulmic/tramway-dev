Rails.application.routes.draw do
  mount Tramway::Api::Engine => "/tramway-api"
end
