class User < ActiveRecord::Base
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable


  # Associations
  has_many :tweets
  has_many :followers, :class_name => 'Follower', :foreign_key => 'user_id'
  has_many :following, :class_name => 'Follower', :foreign_key => 'follower_id'
  has_many :retweets, :class_name => 'Retweet', :foreign_key => 'tweet_id'

  # Validations
  validates :username, :presence => true, :uniqueness => {:case_sensitive => false }
  validates :email, format: { with: /\w*@\w*\.\w*/ }, uniqueness: true
  validates :avatar, format: { with: /(jpg|jpeg|gif|png)/ }

  # Scopes
  scope :except_user, -> (user) {where("id != ?", user)}

  # Callbacks
  before_save :set_user_avatar

  # Set username to user authentification
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end

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
    following.find_or_create_by!(user: user, follower: self)
  end

  def unfollow!(user)
    following.where(user: user, follower: self).first
  end

  def retweet(tweet)
    retweets.find_or_create_by!(user: self, tweet: tweet)
  end



  private

    def set_user_avatar
      if avatar.blank?
        avatar = "no-avatar.jpg"
      end
    end


  
end
