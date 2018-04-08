Tramway::News::Engine.routes.draw do
  resources :news, only: :show
end
