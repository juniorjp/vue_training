class Video < ApplicationRecord
  validates :title, presence: true
  validates :external_id, presence: true, uniqueness: true
end
