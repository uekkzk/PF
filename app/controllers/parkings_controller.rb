class ParkingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @parkings = if params[:prefecture]
      Parking.where(prefecture: params[:prefecture])
    else
    @search = Parking.ransack(params[:q])
    @parking = @search.result
    end
  end

  def new
    @parking = Parking.new
  end

  def create
    @parking = Parking.new(parking_params)
    @parking.user_id = current_user.id
    if @parking.save
      redirect_to parkings_search_path
    else
      # if params[:prefecture] == 0
      #   @parking.errors.add(:base, 'please select select list')
      # end
      render :new
    end
  end

  def show
    @parking = Parking.find(params[:id])
  end

  def edit
    @parking = Parking.find(params[:id])
  end

  def update
    @parking = Parking.find(params[:id])
    @parking.user_id = current_user.id
    @parking.update(parking_params)
    if @parking.save
      redirect_to parking_path(@parking)
    else
      render :edit
    end
  end

  def destroy
  end

  def search
    @search = Parking.ransack(params[:q])
    @parking = @search.result
  end


  private
  def parking_params
    params.require(:parking).permit(:parking_name, :address, :regular_holiday, :fee, :image, :prefecture, :tel, :time, :restriction, :capacity, :postcode, :prefecture_name, :address_city, :address_street, :address_building)
  end
end