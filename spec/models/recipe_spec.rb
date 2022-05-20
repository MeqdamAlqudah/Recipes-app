require 'rails_helper'

RSpec.describe Recipe, type: :model do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user_id: user.id) }
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
end
