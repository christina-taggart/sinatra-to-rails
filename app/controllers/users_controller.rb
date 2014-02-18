class UsersController < ApplicationController
  def edit_post
    post = Post.find_by_edit_key(params[:key])
    category = post.category
    redirect_to edit_category_post_path(category, post)
  end
end