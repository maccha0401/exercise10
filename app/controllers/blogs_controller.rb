class BlogsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :show, :update, :destroy]
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @blogs = Blog.all.order(user_id: :asc).order(id: :asc)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blog_path(@blog.id)
    else
      flash[:danger] = "ブログの作成に失敗しました。"
      redirect_to :root
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      flash[:notice] = "ブログを更新しました。"
      redirect_to blog_path(@blog.id)
    else
      flash.now[:danger] = "ブログの更新に失敗しました。"
      render edit_users_path(@blog.id)
    end
  end

  def destroy
    @blog.destroy
    flash[:danger] = "ブログを削除しました。"
    redirect_to :root
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
