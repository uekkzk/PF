class ParkingsController < ApplicationController
  def index
    @parkings = if params[:prefecture]
      Parking.where(prefecture: params[:prefecture])
    else
      Parking.all
    end

    @search = Parking.ransack(params[:q])
    @parking = @search.result

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
    params.require(:parking).permit(:parking_name, :address, :regular_holiday, :fee, :image, :prefecture)
  end
end