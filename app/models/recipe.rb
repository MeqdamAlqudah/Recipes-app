class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods
  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true

  def total_food_items
    foods.count
  end

  def food_items_total_price
    @total_price = 0
    @food_items = recipe_foods.group(:food_id).sum(:quantity)
    recipe_foods.each do |recipe_food|
      @total_price += (recipe_food.food.price * recipe_food.quantity)
    end
    @total_price
  end
end
