require 'rails_helper'

RSpec.describe Retweet, type: :model do

  it "user can retweet" do
    user = User.create(username: "alex", email: "alex@gmail.com")
    tweet = Tweet.create(user: user, message: "my message")
    rt = Retweet.create(user: user, tweet: tweet)

    expect(rt.tweet.message).to eq("my message")
    expect(rt.tweet.user.username).to eq("alex")
  end

end
