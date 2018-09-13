class UsersController < ApplicationController
  before_action :not_require_login, only: [:new, :create]
  before_action :require_login, except: [:new, :create]
  before_action :set_current_user, only: [:show, :destroy, :update]
  before_action :set_params_user, only: [:create]

  def show
  end

  def new
    if params[:back]
      set_params_user
    else
      @user = User.new
    end
  end

  def create
    if @user.save
      session[:user_id] = @user.id
      redirect_to "/mypage"
    else
      render new_users_path
    end
  end

  def edit
    if params[:back]
      overwrite_params_user
    else
      set_current_user
    end
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザ情報を更新しました。"
      redirect_to "/mypage"
    else
      flash[:danger] = "ユーザ情報の更新に失敗しました。"
      render edit_users_path
    end
  end

  def destroy
    session.delete(:user_id)
    @user.destroy
    flash[:danger] = "ユーザを削除しました。"
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def set_current_user
    @user = current_user
  end
  def set_params_user
    @user = User.new(user_params)
  end
end
