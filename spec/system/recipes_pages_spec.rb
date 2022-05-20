require 'rails_helper'

RSpec.describe 'RecipesPages', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @user = create(:user)
    login_as @user
    @recipe = create(:recipe, name: 'Recipe 1', user_id: @user.id)
    visit '/recipes'
  end

  context 'Page Content' do
    it 'should Recipe 1 text' do
      expect(page).to have_content('Recipe 1')
    end
  end
end
