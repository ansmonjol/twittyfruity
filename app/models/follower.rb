class Follower < ActiveRecord::Base
  belongs_to :user
  belongs_to :follower, class_name: 'User'

  validates_presence_of :user, :follower

end
