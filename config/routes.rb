Rails.application.routes.draw do
  get 'general_shopping_list/index'
  devise_for :users
  get 'home/index'
  Rails.application.routes.default_url_options[:host] = "XXX"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods, except: [:update]
  # Defines the root path route ("/")
  resources :recipes, except: [:update]
  resources :recipes, except: [:update] do
    member do
      get 'recipe_status', to: 'recipes#recipe_status'
      post "ingredients/:ingredient_id", to: "recipes#new_ingredients", as: "new_ingredient"
    end
  end
  resources :recipe_foods, only: [:update, :destroy]
  delete '/recipe_foods/:id', to: 'recipe_foods#destroy', as: 'destroy_recipe_food'
  get '/general_shopping_list', to: 'general_shopping_list#index'
  root "home#index"
end
