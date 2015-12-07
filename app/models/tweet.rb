class Tweet < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validation
  validates :user, presence: true

  # Scopes
  scope :tweets_of_user, -> (user) {where("user_id = ?", user.id).order("created_at DESC")}
end
