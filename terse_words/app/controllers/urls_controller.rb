class UrlsController < ApplicationController
  before_filter :check_authentication
  before_filter :check_authorization, :only => [:show, :destroy]

  def index
    @user = urls_user
    @urls = @user.urls
  end

  def show
    @user = urls_user
    @url = Url.find(params[:id])
  end

  def new
    @user = urls_user
    @url = Url.new
  end

  def create
    @user = urls_user
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

  private

  def urls_user
    User.find(params[:user_id])
  end

  def check_authorization
    redirect_to root_path unless current_user.id == params[:user_id]
  end
end