Rails.application.routes.draw do
  root 'games#index'

  devise_for :users
  resources :games do
    resources :reviews
  end
end
