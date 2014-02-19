class CommentsController < ApplicationController

  def index
    if session[:id]
      @comments = Comment.all
    else
      redirect_to '/signin'
    end
  end

  def show
    if session[:id]
      @comment = Comment.find params[:id]
    else
      redirect_to '/signin'
    end
  end

  def new
    if session[:id]
      @wall = Wall.find params[:wall_id]
      @post = Post.find params[:post_id]
      @comment = Comment.new
    else
      redirect_to '/signin'
    end
  end

  def create
    @wall = Wall.find params[:wall_id]
    @post = Post.find params[:post_id]
    @comment = @post.comments.build(description: params[:comment][:description], user_id: session[:id], post_id: params[:post_id])
    if @comment.save
      redirect_to wall_post_path(@wall, @post)
    else
      puts @comment.errors.full_messages
      render :new
    end
  end

  def edit
    if session[:id]
      @comment = Comment.find params[:id]
    else
      redirect_to '/signin'
    end
  end

  def update
    @comment = Comment.find params[:id]
    @post = Post.find(@comment.post_id)
    @wall = Wall.find(@post.wall_id)
    if @comment.update_attributes params[:comment]
      redirect_to wall_post_comment_path(@wall, @comment, @comment)
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