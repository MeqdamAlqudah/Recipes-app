require 'rails_helper'

RSpec.describe 'ShoppingListPages', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { create(:user) }

  let(:food) { create(:food, user_id: user.id) }
  let(:recipe) { create(:recipe, user_id: user.id) }
  let(:recipe_food) { create(:recipe_food, food_id: food.id, recipe_id: recipe.id) }

  before(:each) do
    login_as user
    visit '/general_shopping_list'
  end

  context 'Page Content' do
    it 'should Shopping List text' do
      expect(page).to have_content('Shopping List')
    end
  end
end
