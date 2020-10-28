class UsersController < ApplicationController
  before_action :authenticate_user!


  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    @user.save
    flash[:success] = "プロフィールを更新しました"
    redirect_to user_path(@user)
  end

  def unsubscribe
    @user = current_user
  end

  def index
    @users = User.all
  end

private
  def user_params
    params.require(:user).permit(:image, :name, :bike_name, :introduction)
  end
end
