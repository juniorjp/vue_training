class Video < ApplicationRecord
  has_many :user_votes
  validates :title, presence: true
  validates :external_id, presence: true, uniqueness: true
end
