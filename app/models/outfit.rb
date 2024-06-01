class Outfit < ApplicationRecord
  belongs_to :lender, class_name: 'User', foreign_key: 'lender_id'
  has_many :reservations
  has_one_attached :photo
end
