Tramway::Page::Engine.routes.draw do
  get '/:slug' => 'pages#show', as: :page
end
