class User < ApplicationRecord
  has_many :outfits, foreign_key: 'lender_id'
  has_many :reservations, foreign_key: 'renter_id'
end
