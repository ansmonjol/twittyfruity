class UsersController < ApplicationController
  before_filter :get_current_user, only: [:show, :follow, :unfollow]

  def index
    @users = User.except_user(current_user)
    @tweet = Tweet.new
  end

  def show
    @tweets = Tweet.tweets_of_user(@user)
  end

  def follow
    current_user.follow!(@user)
    redirect_to :back, notice: "You now folow #{@user.username}, high five !"
  end

  def unfollow
    current_user.unfollow!(@user).delete
    redirect_to users_path, alert: "You've unfolow #{@user.username}" 
  end



  private

    def get_current_user
      @user = User.find(params[:user_id].present? ? params[:user_id] : params[:id])
    end


end
