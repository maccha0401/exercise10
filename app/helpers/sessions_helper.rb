module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user.present?
  end

  def require_login
    unless logged_in?
      session[:previous_url] = request.fullpath
      redirect_to users_login_path
    end
  end

  def not_require_login
    redirect_to :root if logged_in?
  end
end
