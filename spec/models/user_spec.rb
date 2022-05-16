require 'rails_helper'

# user name must be present
# user must be a string
# user must have many recipes
# user must have many foot items

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  describe 'Attributes' do
    it { should validate_presence_of(:name) }
    it 'user name must be a string' do
      expect(user.name).to be_kind_of(String)
    end
  end
end
