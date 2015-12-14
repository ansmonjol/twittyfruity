class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    @random_tweets = Tweet.all.limit(5)
  end
end
