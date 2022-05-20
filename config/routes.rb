Rails.application.routes.draw do
  get 'public_recipes/index'
  get 'general_shopping_list/index'
  devise_for :users
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, except: [:update] do
    member do
      get 'recipe_status', to: 'recipes#recipe_status'
      post "ingredients/:ingredient_id", to: "recipes#new_ingredients", as: "new_ingredient"
    end
  end
  resources :recipe_foods, only: [:update, :destroy]
  delete '/recipe_foods/:id', to: 'recipe_foods#destroy', as: 'destroy_recipe_food'
  get '/public_recipes', to: 'public_recipes#index'
  get '/general_shopping_list', to: 'general_shopping_list#index'
  root "foods#index"
end
