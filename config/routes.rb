Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users
  resources :outfits
  resources :reservations

  resources :chat_rooms do
    resources :messages, only: [:create]
    member do
      post 'add_user'
      delete 'remove_user'
    end
  end
end
