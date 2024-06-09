class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :outfits, foreign_key: 'lender_id'
  has_many :reservations, foreign_key: 'renter_id'
  has_many :reserved_outfits, through: :reservations, source: :outfit

  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :chat_rooms
end
