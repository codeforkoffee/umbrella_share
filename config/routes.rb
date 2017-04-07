Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  get 'umbrellas/my_umbrella', to: "umbrellas#my_umbrella"

  resources :umbrellas do
    # generates route helper and route:
    # umbrella_join POST   /umbrellas/:umbrella_id/join(.:format) umbrellas#join

    post 'join' => :join
    delete 'cancel' => :cancel
  end
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'umbrellas#index'
end
