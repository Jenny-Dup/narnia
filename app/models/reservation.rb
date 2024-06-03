class Reservation < ApplicationRecord
  belongs_to :outfit
  belongs_to :renter, class_name: 'User', foreign_key: 'renter_id'
end
