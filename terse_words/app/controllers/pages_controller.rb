class PagesController < ApplicationController
  def index
    redirect_to "/users/#{session[:id]}" if session[:id]
  end
end