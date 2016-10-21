class Game < ApplicationRecord
  belongs_to :user
  belongs_to :platform

  validates :title, presence: true
  validates :developer, presence: true
  validates :description, presence: true, length: { maximum: 350 }
  validates :platform_id, presence: true
end
