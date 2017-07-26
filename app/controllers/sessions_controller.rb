class SessionsController < ApplicationController

  def new
    # if I am already logged in, immediately redirect me to next page
    # otherwise, have me sign in...

    @user = User.new
    render :new
  end

  def create
    # given the login information (user_params)
    # check that I exist in the database
    # verify that my password matches the one in the database
    # if everyting checks out, set something in my session and redirect me to next page
    # if something is fishy, re-render the login form with a flash.now error message
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    # Log the user in and redirect to the user's show page.
      log_in user
      redirect_to user
    else
      flash[:error] = "Invalid email/password combination."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out. See you later."
    redirect_to '/login'
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
