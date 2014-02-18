class UrlsController < ApplicationController
  before_filter :check_authorization

  def check_authorization
    unless session[:id] == params[:user_id].to_i
      redirect_to root_path
    end
  end

  def index
    @user = User.find(params[:user_id])
    @urls = @user.urls
  end

  def show
    @user = User.find(params[:user_id])
    @url = Url.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @url = Url.new
  end

  def create
    @user = User.find(params[:user_id])
    @url = @user.urls.build(params[:url])
    if @url.save
      redirect_to user_url_path(@user, @url)
    else
      render :new
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to root_path
  end
end