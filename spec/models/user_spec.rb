require 'rails_helper'

RSpec.describe User, type: :model do
  
  it "can be saved" do
    user = User.create(username: "alex", email: "alex@gmail.com")
    user.save!

    my_user = User.last
    expect(my_user.username).to eq("alex")
    expect(my_user.email).to eq("alex@gmail.com")
  end

  it "need username and email" do
    user = User.new
    expect(user.valid?).to eq(false)

    user.username = "alex"
    expect(user.valid?).to eq(false)
  end

  it "require valid email" do
    user = User.new(username: "alex")
    expect(user.valid?).to eq(false)

    user.email = "alex"
    expect(user.valid?).to eq(false)

    user.email = "alex@alex"
    expect(user.valid?).to eq(false)

  end

end
