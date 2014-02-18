class UrlsController < ApplicationController
include UrlsHelper

  def index
    @new_url = Url.new
  end

  def create
    original_url = format_url(params[:url][:original_url])
    url_digest = create_digest(original_url)
    @url = Url.where(url_digest: url_digest).first_or_create(original_url: original_url)
      if @url.valid?
        @url.visit_count += 1
        @url.save
        redirect_to url_path(@url)
      else
        @errors = true
        redirect_to root_path
      end
  end

  def show
    @url = Url.find params[:id]
    @new_url = Url.new
  end



end