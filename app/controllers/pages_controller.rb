class PagesController < ApplicationController

  def index
    if session[:id]
      @current_user = true
      @user = User.find(session[:id])
      @walls = @user.walls
      redirect_to user_path(@user)
    else
      @current_user = false
    end
  end
end