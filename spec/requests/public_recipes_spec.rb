require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  let(:user) { create(:user) }
  before(:example) { login_as user }

  describe 'GET /index' do
    before(:example) { get('/public_recipes') }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
    it 'body should have Public Recipes text' do
      expect(response.body).to include 'Public Recipes'
    end
  end
end
