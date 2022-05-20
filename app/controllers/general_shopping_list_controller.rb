class GeneralShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @ingredients = RecipeFood.group(:food_id).sum(:quantity)
    @total_food_items = @ingredients.count
    @total_cost = 0
    @ingredients.each do |food_id, quantity|
      @total_cost += (Food.find(food_id).price * quantity)
    end
  end
end
