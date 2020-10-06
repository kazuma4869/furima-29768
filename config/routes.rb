Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
  end
  resources :rooms, only: [:update]
end
