require 'rails_helper'
# presence of all attributes
# validation of all attributes
RSpec.describe RecipeFood, type: :model do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user_id: user.id) }
  let(:food) { create(:food, user_id: user.id) }
  let(:recipe_food) { create(:recipe_food, food_id: food.id, recipe_id: recipe.id) }

  describe 'Attributes' do
    it { should validate_presence_of(:quantity) }
    it 'quantity must be string' do
      expect(recipe_food.quantity).to be_kind_of(String)
    end
  end
end
