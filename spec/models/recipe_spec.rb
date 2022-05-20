require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user_id: user.id) }
  let(:food1) { create(:food, user_id: user.id) }
  let(:food2) { create(:food, user_id: user.id) }
  before(:each) do
    create(:recipe_food, food_id: food1.id, recipe_id: recipe.id)
    create(:recipe_food, food_id: food2.id, recipe_id: recipe.id)
  end
  describe 'Attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:preparation_time) }
    it { should validate_presence_of(:cooking_time) }
    it { should validate_presence_of(:description) }
    it 'name must be string' do
      expect(recipe.name).to be_kind_of(String)
    end
    it 'description must be a string' do
      expect(recipe.description).to be_kind_of(String)
    end
    it 'cooking_time must be float' do
      expect(recipe.cooking_time).to be_kind_of(BigDecimal)
    end
    it 'preparation_time must be float' do
      expect(recipe.preparation_time).to be_kind_of(BigDecimal)
    end
  end

  describe 'Methods' do
    it 'recipe has total of three food items' do
      food_items = recipe.total_food_items
      expect(food_items).to eq 2
    end
    it 'total cost of all food items should be 4' do
      total_price = recipe.food_items_total_price
      expect(total_price).to eq 4
    end
  end
end
