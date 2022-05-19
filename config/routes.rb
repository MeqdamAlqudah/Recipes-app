Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  Rails.application.routes.default_url_options[:host] = "XXX"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, except: [:update]
  # Defines the root path route ("/")
  resources :recipes, except: [:update]
  root "home#index"
end
