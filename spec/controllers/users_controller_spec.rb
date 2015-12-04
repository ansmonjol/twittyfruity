require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe "GET home" do
    it "returns http success and a homepage" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET home" do
    it "returns http success and a homepage" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end

end
