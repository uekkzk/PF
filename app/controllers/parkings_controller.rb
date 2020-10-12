class ParkingsController < ApplicationController
  def index
    @parkings = Parking.all
  end

  def new
    @parking = Parking.new
  end

  def create
    @parking = Parking.new(parking_params)
    @parking.user_id = current_user.id
    if @parking.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def parking_params
    params.require(:parking).permit(:parking_name, :address, :regular_holiday, :fee, :image)
  end
end