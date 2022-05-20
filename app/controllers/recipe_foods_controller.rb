class RecipeFoodsController < ApplicationController
  def update
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.update(quantity: params[:quantity])
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy!
    redirect_to recipe_path(@recipe_food.recipe_id)
  end
end
