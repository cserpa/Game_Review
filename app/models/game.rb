class Game < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :developer, presence: true
  validates :description, presence: true, length: { maximum: 350 }
end
