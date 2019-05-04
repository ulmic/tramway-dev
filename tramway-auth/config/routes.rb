Tramway::Auth::Engine.routes.draw do
  scope module: :web do
    resource :session, only: [ :new, :create, :destroy ]
  end
end
