class VotesController < ApplicationController
  def create
    if session[:id]
      post = Post.find(params[:post_id])
      user = User.find(session[:id])
      Vote.create(user_id: user.id, post_id: post.id)
    end
    redirect_to post_path(post)
  end
end