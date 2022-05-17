require 'rails_helper'

# presence of all attributes
# validation of all attributes

RSpec.describe Food, type: :model do
  let(:user) { create(:user) }
  let(:food) { create(:food, user_id: user.id) }
  describe 'Attributes' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:measurement_unit) }
    it { should validate_presence_of(:price) }
    it 'name must be string' do
      expect(food.name).to be_kind_of(String)
    end
    it 'measurement_unit must be a string' do
      expect(food.measurement_unit).to be_kind_of(String)
    end
    it 'price must be an integer' do
      expect(food.price).to be_kind_of(Integer)
    end
  end
end
