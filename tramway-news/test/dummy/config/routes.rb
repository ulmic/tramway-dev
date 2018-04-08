Rails.application.routes.draw do
  mount Tramway::News::Engine => "/tramway-news"
end
