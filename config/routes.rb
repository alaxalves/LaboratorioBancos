Rails.application.routes.draw do
  resources :ators
  resources :filmes
  resources :papels
  resources :personagems
  resources :estudios

  root 'pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
