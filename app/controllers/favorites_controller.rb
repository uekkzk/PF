class FavoritesController < ApplicationController

  def create
    @parking =  Parking.find(params[:parking_id])
    @favorite = Favorite.new(user_id: current_user.id, parking_id: @parking.id)
    @favorite.save
    redirect_to request.referer

  end

  def destroy
    @parking = Parking.find(params[:parking_id])
    @favorite = Favorite.find_by(user_id: current_user.id, parking_id: @parking.id)
    @favorite.destroy
    redirect_to request.referer
  end

end
