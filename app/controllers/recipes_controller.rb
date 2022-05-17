class RecipesController < ApplicationController
  before_action :create_recipe, only: [:create]
  before_action :authenticate_user!

  def index
    @recipes = Recipe.all.where(user_id: current_user.id)
  end

  def show; end

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

  def destroy; end

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
