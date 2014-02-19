class UsersController < ApplicationController
  before_filter :check_authentication
  before_filter :check_authorization, :only => [:show, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    if @user.save
      login(@user)
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

  private
  def check_authorization
    redirect_to root_path unless current_user.id == params[:id]
  end
end