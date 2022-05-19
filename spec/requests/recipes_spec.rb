require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user_id: user.id) }
  before(:example) { login_as user }

  describe 'GET /index' do
    before(:example) { get('/recipes') }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
    it 'body should have remove button text' do
      expect(response.body).to include 'Recipes'
    end
  end

  describe 'GET /show' do
    before(:example) { get("/recipes/#{recipe.id}") }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      expect(response).to render_template(:show)
    end
    it 'body should have remove button text' do
      expect(response.body).to include 'Preparation time'
    end
  end

  describe 'GET /new' do
    before(:example) { get '/recipes/new' }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the new recipe template' do
      expect(response).to render_template(:new)
    end
    it 'body should have remove button text' do
      expect(response.body).to include 'New Recipe'
    end
  end

  describe 'GET /destroy' do
    before(:example) { delete("/recipes/#{recipe.id}") }
    it 'returns http success' do
      expect(response).to have_http_status(:found)
    end
  end
end
