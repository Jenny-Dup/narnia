Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users

  resources :outfits do
    resources :reservations
  end
  # reservations routes
  # get 'reservations', to: 'reservations#index'
  # get 'reservations/:outfit_id/new', to: 'reservations#new', as: 'new_reserve'
  # post 'reservations/:outfit_id', to: 'reservations#create', as: 'reserve_outfit'
end
