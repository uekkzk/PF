class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def is_active
  end
end
