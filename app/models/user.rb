class User < ApplicationRecord
  has_many :user_votes
  validates :uuid, presence: true

  MAX_ALLOWED_VOTES = 50
end
