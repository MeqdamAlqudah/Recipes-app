class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.all.where(public_recipe: true)
  end
end
