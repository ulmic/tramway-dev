Rails.application.routes.draw do
  mount Tramway::Core::Engine => "/tramway-core"
end
