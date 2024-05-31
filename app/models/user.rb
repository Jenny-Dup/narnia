class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_many :outfits, foreign_key: 'lender_id'
  has_many :reservations, foreign_key: 'renter_id'
end
