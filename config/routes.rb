Rails.application.routes.draw do
  devise_for :users
  root to: "outfits#index"

  resources :users
  resources :reservations, only: %i[show destroy edit update]

  resources :chat_rooms do
    resources :messages, only: [:create]
    member do
      post 'add_user'
      delete 'remove_user'
    end
  end

  resources :outfits do
    resources :reservations, only: %i[new create]
  end

end
