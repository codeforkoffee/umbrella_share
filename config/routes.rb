Rails.application.routes.draw do
  devise_for :users
  get 'umbrellas/my_umbrella', to: "umbrellas#my_umbrella"
  resources :umbrellas
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'umbrellas#index'
end
