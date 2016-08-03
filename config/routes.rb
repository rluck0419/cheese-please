Rails.application.routes.draw do
  get 'sessions/sign_in'
  delete 'sessions/sign_out'
  post 'sessions/authenticate'

  resources :user_cheeses
  resources :cheeses
  resources :users

  root "cheeses#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
