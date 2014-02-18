class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    url = params[:url]
    @new_url = Url.new(long_url: url[:long_url])
    @new_url.short_url = @new_url.shorten_url
    @new_url.save
  end

  def show
    @long_url = Url.last.long_url
    @short_url = Url.last.short_url
  end
end