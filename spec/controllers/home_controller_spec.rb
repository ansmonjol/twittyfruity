require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  render_views

  describe "GET home" do
    it "returns http success and a homepage" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Bienvenue sur Fruitter")
    end
  end
end
