class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  # Associations
  has_many :tweets
  has_many :followers, :class_name => 'Follower', :foreign_key => 'user_id'
  has_many :following, :class_name => 'Follower', :foreign_key => 'follower_id'

  # Prety user display for rails_admin
  def to_s
    return self.username
  end
  def title
    return self.to_s
  end


  def follow?(user)
    following.where(user: user, follower: self).present? ? true : false
  end

  def follow!(user)
    following.first_or_create!(user: user, follower: self)
  end

  def unfollow!(user)
    return following.where(user: user, follower: self).first
  end


  
end
