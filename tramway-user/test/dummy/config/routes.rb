Rails.application.routes.draw do
  mount Tramway::User::Engine => "/tramway-user"
end
