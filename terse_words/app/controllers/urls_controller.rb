class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @url = Url.new
  end

  def create
    @user = User.find(params[:user_id])
    @url = Url.new(params[:url])
    if @url.save
      redirect_to user_url_path(@user, @url)
    else
      render :new
    end
  end

  def edit
    @url = Url.find(params[:id])
  end

  def update
    @url = Url.find(params[:id])
    if @url.update_attributes(params[:url])
      redirect_to user_url_path(@url.user, @url)
    else
      render :edit
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to root_path
  end
end