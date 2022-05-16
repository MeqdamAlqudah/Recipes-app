require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }
  describe 'Attributes' do
    it { should validate_presence_of(:name) }
    it 'user name must be a string' do
      expect(user.name).to be_kind_of(String)
    end
  end
end
