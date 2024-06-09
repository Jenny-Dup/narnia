class ReservationsController < ApplicationController
  def index
    @outfits = Outfit.all
  end

  def new
    @outfit = Outfit.find(params[:outfit_id])
    @reservation = Reservation.new
  end

  def create
    @outfit = Outfit.find(params[:outfit_id])
    @reservation = current_user.reservations.build(reservation_params)
    @reservation.outfit = @outfit

    if @reservation.save
      redirect_to @outfit, notice: 'Reservation was successfully created.'
    else
      render :new  # Render the new reservation form on validation errors
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
