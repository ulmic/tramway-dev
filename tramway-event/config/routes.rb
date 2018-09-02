Tramway::Event::Engine.routes.draw do
  resources :events, only: :show
end
