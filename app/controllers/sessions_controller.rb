class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user
      
      flash[:notice] = "Welcome!"
      redirect_to @user
    else
      flash[:error] = "Error. Try again."
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:notice] = "Logged out. See you later."
    redirect_to root_path
  end

  private

  def user_params
    params.require(:session).permit(:email, :password_digest)
  end
end
