class Outfit < ApplicationRecord
  has_many :reservations
  has_many :renters, through: :reservations, source: :user
  has_one_attached :photo
end
