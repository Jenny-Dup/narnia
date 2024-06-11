class ReservationsController < ApplicationController
  def new
    @outfit = Outfit.find(params[:outfit_id])
    @reservation = Reservation.new
  end

  def edit
    @reservation = current_user.reservations.find(params[:id])
  end

  def update
    @reservation = current_user.reservations.find(params[:id])
    if @reservation.update(reservation_params)
      redirect_to reservation_path(@reservation), notice: "Reservation successfully updated."
    else
      render :edit  # Render the edit form again with errors
    end
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

  def show
    @reservations = current_user.reservations.includes(:outfit)
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to reservation_path(current_user), notice: "Reservation successfully deleted."
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end
