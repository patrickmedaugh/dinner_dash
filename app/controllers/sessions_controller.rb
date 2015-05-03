class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to_landing_page(@user)
    else
      flash[:notice] = "Invalid login"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to login_path
    flash[:notice] = "Successfully logged out"
  end

  private

  def redirect_to_landing_page(user)
    if user.admin?
      redirect_to admin_path(user)
    else
      redirect_to user
    end
  end

end
