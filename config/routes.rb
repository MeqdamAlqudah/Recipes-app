Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :recipes, except: [:update] do
    member do
      post "ingredients/:ingredient_id", to: "recipes#new_ingredients", as: "new_ingredient"
    end
  end
  resources :recipe_foods, only: [:destroy]
  root "home#index"
end
