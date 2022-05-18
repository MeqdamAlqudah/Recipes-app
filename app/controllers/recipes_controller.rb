class RecipesController < ApplicationController
  before_action :create_recipe, only: [:create]
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all.where(user_id: current_user.id)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.foods
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
