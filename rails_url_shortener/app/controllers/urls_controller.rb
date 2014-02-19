class UrlsController < ApplicationController

  def index
    @url = Url.new
    @urls = Url.all
  end

  def create
    @url = Url.new(params[:url])
    if @url.save
      redirect_to root_path
    else
      @urls = Url.all
      render :index
    end
  end

  def long_url
    @url = Url.find_by_short_url(params[:short_url])
    redirect_to @url.long_url
  end
end