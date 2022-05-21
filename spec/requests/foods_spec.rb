require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  let(:user) { create(:user) }
  let(:food) { create(:food, user_id: user.id) }
  before(:example) { login_as user }

  describe 'GET /index' do
    before(:example) { get('/foods') }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the index template' do
      expect(response).to render_template(:index)
    end
    it 'body should have remove button text' do
      expect(response.body).to include 'Food'
    end
  end

  describe 'GET /new' do
    before(:example) { get '/foods/new' }
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'renders the new recipe template' do
      expect(response).to render_template(:new)
    end
    it 'body should have remove button text' do
      expect(response.body).to include 'New Food'
    end
  end

  describe 'GET /destroy' do
    before(:example) { delete("/foods/#{food.id}") }
    it 'returns http success' do
      expect(response).to have_http_status(:ok)
    end
  end
end
