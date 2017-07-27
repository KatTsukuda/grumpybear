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
      flash[:error] = @user.errors.full_messages.to_sentence
      render 'new'
    end

  end

  def edit
    set_user

    if current_user != set_user
      flash[:error] = "Restricted access. You are not authorized to edit this account."
      redirect_to user_path(@user)
    end
  end

  def update
    set_user

    if set_user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect to user_path(@user)
      flash[:error] = @user.errors.full_messages.to_sentence
    end

  end

  def show
    set_user

    if !set_user
      redirect_to root_path
    end
  end

  def destroy

    if current_user != set_user
      flash[:error] = "Restricted access. You are not authorized to delete this account."
      redirect_to user_path(@user)
    else
      set_user
      @user.destroy
      flash[:notice] = "Your acccount has been successfully deleted."
      redirect_to root_path
    end

  end

  private

  def set_user
    @user = User.friendly.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:org_name, :email, :password, :country, :zip_code)
  end

end
