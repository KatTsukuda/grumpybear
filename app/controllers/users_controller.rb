class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages
      render 'new'
    end

  end

  def edit
    set_user

    if current_user.id != @user.id
      flash[:error] = "Restricted access. This is not your profile to edit."
      redirect_to user_path(set_user)
    end
  end

  def update
    set_user

    if set_user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect to user_path(@user)
      flash[:error] = @user.errors.full_messages
    end

  end

  def show
    set_user
  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:org_name, :email, :password, :country, :zip_code)
  end

end
