Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :recipes, except: [:update]
  root "home#index"
end
