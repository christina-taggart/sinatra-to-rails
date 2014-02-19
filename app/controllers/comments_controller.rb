class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find params[:id]
  end

  def new
    @post = Post.find params[:post_id]
    @comment = Comment.new
  end

  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.build(description: params[:comment][:description], user_id: session[:id], post_id: params[:post_id])
    if @comment.save
      redirect_to post_path(@post)
    else
      puts @comment.errors.full_messages
      render :new
    end
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    @comment = Comment.find params[:id]
    if @comment.update_attributes params[:comment]
      redirect_to post_comment_path(@comment.post, @comment)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    redirect_to post_path
  end

end