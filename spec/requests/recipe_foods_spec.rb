require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  let(:user) { create(:user) }
  let(:food) { create(:food, user_id: user.id) }
  let(:recipe) { create(:recipe, user_id: user.id) }
  let(:recipe_food) { create(:recipe_food, food_id: food.id, recipe_id: recipe.id) }
  before(:example) { login_as user }

  describe 'GET /destroy' do
    before(:example) { delete("/recipe_foods/#{recipe_food.id}") }
    it 'returns http success' do
      expect(response).to have_http_status(:found)
    end
  end
end
