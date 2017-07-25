module SessionsHelper

def login(user)
    session[:user_id] = user.id
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    @current_user = session[:user_id] = nil
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged-in to access this section."
      redirect_to login_path
    end
  end

  def require_this_is_me
    unless logged_in? && params[:id] == current_user
      flash[:error] = "Restricted access. You do not have access to this account."
      redirect_to login_path
    end
  end

  # def require_posts_permission
  #   unless logged_in? &&  == current_user.id
  #     flash[:error] = "Hey, idiot. You can't edit or delete someone else's posts. Not cool."
  #     redirect_to posts
  #   end
  # end


end
