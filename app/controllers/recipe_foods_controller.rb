class RecipeFoodsController < ApplicationController
  def edit
    @recipe_food = RecipeFood.find(params[:id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_food_update)
      flash[:notice] = "Updated quantity for #{@recipe_food.food.name} successfully"
      redirect_to recipe_path(@recipe_food.recipe_id)
    else
      flash[:error] = "Couldn't update quantity"
      redirect_to recipe_food_path(params[:id])
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy!
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  private

  def recipe_food_update
    params.require(:recipe_food).permit(:quantity)
  end
end
