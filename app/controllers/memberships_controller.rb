class MembershipsController < ApplicationController

  def new
    @membership = Membership.new
    @user = User.find(session[:id])
    @wall = Wall.find(params[:wall_id])
  end

  def create
    wall = Wall.find(params[:wall_id])
    if wall.access_code == params[:access_code] && session[:id]
      user = User.find(session[:id])
      Membership.create(user_id: user.id, wall_id: wall.id)
    end
    redirect_to wall_path(wall)
  end
end