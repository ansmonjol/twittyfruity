require 'rails_helper'

RSpec.describe Follower, type: :model do

  it "user can have a follower" do
    user = User.create(username: "alex", email: "alex@gmail.com")
    user2 = User.create(username: "alain", email: "alain@gmail.com")
    follo = Follower.create(user: user, follower: user2)

    expect(follo.follower.username).to eq("alain")
  end

end
