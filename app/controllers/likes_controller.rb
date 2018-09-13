class LikesController < ApplicationController
  def index
    @blogs = current_user.like_blogs
  end
  
  def create
    @like = Like.create(user_id: current_user.id, blog_id: params[:blog_id])
    @blog = Blog.find(params[:blog_id])
    # @like = current_user.likes.create(user_id: :current_user.id, blog_id: params[:blog_id])
    # @likes = Like.find_by(blog_id: params[blog_id])
  end
  
  def destroy
    @like = Like.find(params[:id]).destroy
    @blog = Blog.find(@like.blog_id)
    # current_user.likes.find_by(blog_id: params[:blog_id]).destroy
    # @likes = Like.find_by(blog_id: params[blog_id])
  end
end
