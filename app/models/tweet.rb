class Tweet < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validation
  validates :user, presence: true
  validates :message, length: {maximum: 5}, allow_blank: false

  # Scopes
  scope :tweets_of_user, -> (user) {where("user_id = ?", user.id)}
end
