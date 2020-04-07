class User < ApplicationRecord
  validates :uuid, presence: true
  validates :current_ip, presence: true
end
