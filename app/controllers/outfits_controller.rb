class OutfitsController < ApplicationController
  before_action :set_outfit, only: %i[show edit update destroy]

  def index
    @outfits = Outfit.all
  end

  def show
    @reservation = Reservation.new  # Initialize a new reservation object for the form
  end

  def new
    @outfit = Outfit.new
  end

  def create
    @outfit = Outfit.new(outfit_params)
    @outfit.lender = current_user
    if params[:outfit][:photo].present?
      upload_photo(params[:outfit][:photo])
    end

    if @outfit.save
      redirect_to outfits_path, notice: 'Outfit was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @outfit.update(outfit_params)
      redirect_to @outfit, notice: 'Outfit was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @outfit.destroy
    redirect_to outfits_path, notice: 'Outfit was successfully destroyed.'
  end

  private

  def set_outfit
    @outfit = Outfit.find(params[:id])
  end

  def outfit_params
    params.require(:outfit).permit(:name, :description, :location, :lender_id, :price, :photo)
  end

  def upload_photo(photo)
    result = Cloudinary::Uploader.upload(photo.path)
    @outfit[:photo] = result['secure_url']
  end
end
