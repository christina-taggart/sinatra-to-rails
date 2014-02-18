class UsersController < ApplicationController
  before_filter :check_authorization

  def check_authorization
    unless session[:id] == params[:id].to_i
      redirect_to root_path
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    if @user.save
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end
end