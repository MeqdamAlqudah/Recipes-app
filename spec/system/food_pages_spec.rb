require 'rails_helper'

RSpec.describe 'FoodPages', type: :system do
  before do
    driven_by(:rack_test)
  end

  before(:each) do
    @user = create(:user)
    login_as @user
    @food = create(:food, name: 'Apple', user_id: @user.id)
    visit '/foods'
  end

  context 'Page Content' do
    it 'should Apple text' do
      expect(page).to have_content('Apple')
    end
  end
end
