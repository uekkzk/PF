class RelationshipsController < ApplicationController
  before_action :authenticate_user!


  def create
  current_user.follow(params[:user_id])
  redirect_to request.referer
  end

  def destroy
  current_user.unfollow(params[:user_id])
  redirect_to request.referer
  end

  def following_user
    @user = current_user
  end

  def followed_user
    @user = current_user
  end
end


