class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :outfit

  validate :no_overlapping_reservations

  def no_overlapping_reservations
    if overlapping_reservations.exists?
      errors.add(:base, "This outfit is already reserved for the selected dates.")
    end
  end

  def overlapping_reservations
    Reservation.where(outfit_id: outfit_id)
                .where.not(id: id)  # Exclude self if updating an existing record
                .where("(start_date, end_date) OVERLAPS (?, ?)", start_date, end_date)
  end
end
