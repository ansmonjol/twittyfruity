require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  describe "GET Sign In" do
    it "returns http success and a sign_in" do
      # current_user = User.create(username: "myusername", email: "user@mail.com", admin: true)
      get :index
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Trouver un fruitos")
    end
  end
end
