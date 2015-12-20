class Tweet < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :retweeted_tweets, :class_name => 'Retweets', :foreign_key => 'user_id'

  # Validation
  validates :user, presence: true
  validates :message, length: {maximum: 140}, allow_blank: false

  # Scopes
  scope :tweets_of_user, -> (user) {where("user_id = ?", user.id)}
end
