class TweetsController < ApplicationController
  before_filter :get_current_user, only: [:index, :show]

  def index
    user_ids = []
    current_user.following.each do |f| user_ids << f.user.id end
    follower_tweets_array = Tweet.where(user: user_ids)
    @tweets = follower_tweets_array
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = current_user
    if @tweet.save
      redirect_to user_path(current_user), notice: 'Fruit was successfully created !' 
    else
      render :new 
    end
  end



  private

    def tweet_params
      params.require(:tweet).permit(:message)
    end

    def get_current_user
      @user = User.find(params[:user_id].present? ? params[:user_id] : params[:id])
    end
end
