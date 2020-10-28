class ParkingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @parkings = if params[:prefecture_code]
      Parking.where(prefecture_code: params[:prefecture_code])
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
      flash[:success] = "パーキングを投稿しました"
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
      flash[:success] = "パーキングを更新しました"
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
    params.require(:parking).permit(:postcode, :prefecture_code, :address, :parking_name, :regular_holiday, :fee, :tel, :time, :restriction, :capacity)
  end
end