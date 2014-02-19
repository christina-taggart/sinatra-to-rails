class SessionsController < ApplicationController

  def sign_in
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      login(@user)
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def sign_out
    session[:id] = nil
    redirect_to root_path
  end

end