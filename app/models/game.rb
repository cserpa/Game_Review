class Game < ApplicationRecord
  belongs_to :user
  belongs_to :platform
  has_many :reviews

  validates :title, presence: true
  validates :developer, presence: true
  validates :description, presence: true, length: { maximum: 350 }
  validates :platform_id, presence: true
  validates :game_img, presence: true

  has_attached_file :game_img, styles: { game_index: "250x350>", game_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :game_img, content_type: /\Aimage\/.*\z/
end
