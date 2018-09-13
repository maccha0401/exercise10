class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # ■メールアドレスでログイン
    @user = User.find_by(email: params[:session][:email].downcase)
    # ログインできた場合、前のページ、もしくはブログの一覧へ。
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      if session[:previous_url].nil?
        redirect_to :root
      else
        redirect_to session[:previous_url]
        session.delete(:previous_url)
      end
    # ■ログインできなかった場合、ログイン画面へ。
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render "new"
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:notice] = "ログアウトしました。"
    redirect_to :root
  end
end
