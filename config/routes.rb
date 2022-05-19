Rails.application.routes.draw do
  get 'public_recipes/index'
  devise_for :users
  get 'home/index'
  resources :recipes, except: [:update] do
    member do
      get 'recipe_status', to: 'recipes#recipe_status'
      post "ingredients/:ingredient_id", to: "recipes#new_ingredients", as: "new_ingredient"
    end
  end
  resources :recipe_foods, only: [:update, :destroy]
  delete '/recipe_foods/:id', to: 'recipe_foods#destroy', as: 'destroy_recipe_food'
  get '/public_recipes', to: 'public_recipes#index'
  root "home#index"
end
