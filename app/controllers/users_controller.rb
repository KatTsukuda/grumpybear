class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  before_action :require_ownership, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      redirect_to new_user_path
    end

    def show
      set_user
      render template: "users/show"
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
