class Review < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validates :rating, presence: true
  validates :comment, presence: true
end
