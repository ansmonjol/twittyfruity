require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
  render_views
  before(:each) do
    login_user
  end


  describe "Tweets" do

    # it "can access to index page" do
    #   get :new
    #   expect(response).to have_http_status(:success)
    #   expect(response.body).to include("Trouver un fruitos")
    # end
    
    # it "must have a current_user" do
    #   subject.current_user.should_not be_nil
    # end

    # it "can sign out" do
    #   sign_out :user
    #   subject.current_user.should be_nil
    # end

  end


end
