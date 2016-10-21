class User < ApplicationRecord
  has_many :games

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
