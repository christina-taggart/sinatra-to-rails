class SessionsController < ApplicationController

  def sign_in
    p params
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      redirect_to root_path
    end
  end

  def sign_out
    session[:id] = nil
    redirect_to root_path
  end

end