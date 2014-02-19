class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = @user.authenticate(params[:session][:email], params[:session][:password])
      session[:id] = @user.id
      redirect_to user_path(@user)
    else
      flash.now[:error] = "invalid email/password combo"
      render :new
    end
  end

  def destroy
    session.clear
    puts "session was deleted"
    redirect_to root_path
  end
end