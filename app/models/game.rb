class Game < ApplicationRecord

  validates :title, presence: true
  validates :developer, presence: true
  validates :description, presence: true, length: { maximum: 200 }
end
