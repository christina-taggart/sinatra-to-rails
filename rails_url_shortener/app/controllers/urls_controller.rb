class UrlsController < ApplicationController

  def index
    @url = Url.new
  end

  def create
    @new_url = Url.new(params[:url])
    if !@new_url.save
      render :new
    end
  end

  def show
    url = Url.find_by_short_url(params[:id])
    redirect_to "#{url.long_url}"
  end
end