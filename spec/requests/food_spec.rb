require 'rails_helper'
# get list of foods
RSpec.describe "Foods", type: :request do
  let(:user) {create(:user)}
  before(:example) { login_as user }
  let(:recipe_food){create(:recipe_food)}
  let(:food){ create(:food, user_id: user.id) }
  describe "GET /index" do
    let(:food) { create(:food, user_id: user.id) }
    subject { get foods_path }
    it "renders the index template" do
      expect(subject).to render_template(:index)
      expect(subject).to render_template("index")
      expect(subject).to render_template("food/index")
    end

    it "does not render a different template" do
      expect(subject).to_not render_template("food/show")
    end
    
  end

  describe 'GET /new' do
    before(:example) { get new_food_path }
    it 'returns http success' do
      get new_food_path
      expect(response).to have_http_status(:success)
    end
    it 'renders the new food template' do
      expect(response).to render_template(:new)
    end
    it 'body should have new button text' do
      expect(response.body).to include 'New Food'
    end
  end

  describe 'DELETE /destroy' do
    it 'returns http success' do
      post "/foods"
      delete '/foods/1'
      expect(response).to have_http_status(:success)
    end
  end
end
