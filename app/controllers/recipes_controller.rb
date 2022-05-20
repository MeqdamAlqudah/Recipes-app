class RecipesController < ApplicationController
  before_action :create_recipe, only: [:create]
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :recipe_params

  def index
    @recipes = Recipe.all.where(:user_id => current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.foods
    @foods = Food.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe.user_id = current_user.id
    if @recipe.save
      flash[:notice] = 'Recipe was successfully created'
      redirect_to recipes_path
    else
      flash[:notice] = 'An error has occurred while creating the recipe'
      redirect_to new_recipe_path
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    flash[:notice] = if @recipe.destroy
                       'Recipe was successfully removed'
                     else
                       'An error has occurred while deleting the recipe'
                     end
    redirect_to recipes_path
  end

  def new_ingredients
    RecipeFood.create!(quantity: params[:quantity], recipe_id: params[:id], food_id: params[:ingredient_id])
    redirect_to recipe_path(params[:id])
  end

  def recipe_status
    @recipe = Recipe.find(params[:id])
    @recipe.update!(public_recipe: !@recipe.public_recipe)
  end

  private

  def create_recipe
    @recipe = Recipe.new(recipe_params)
  end

  def recipe_params
    params.require(:recipe).permit(
      :name, :preparation_time, :cooking_time, :description, :public_recipe
    )
  end
end
