module ControllerMacros
  FactoryGirl.define do
    factory :user do
      username "jdoe"
      email "john@doe.test"
      password "bigsecret"
      password_confirmation "bigsecret"
    end
  end

   def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    @current_user = user
    sign_in user
  end
end