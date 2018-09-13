module BlogsHelper
  def new_or_edit_blog_path
    blogs_path if controller.action_name == "new"
    blog_path(params[:id]) if controller.action_name == "edit"
  end
end
