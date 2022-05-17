require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let(:user) { create(:user) }
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
    it 'returns http success' do
      get '/recipes/show'
      expect(response).to have_http_status(:success)
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
    it 'returns http success' do
      get '/recipes/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
