class RepliesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @reply = @post.replies.build
  end
end