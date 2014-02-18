class RedirectsController < ApplicationController
  def redirect
    url = Url.find_by_short_url("http://localhost:3000/" + params[:short_url_key])
    redirect_to url.long_url
  end
end