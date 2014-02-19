class PostsController < ApplicationController
  def index
    if session[:id]
      @wall = Wall.find params[:wall_id]
      @posts = @wall.posts
    else
      redirect_to '/signin'
    end
  end

  def show
    if session[:id]
      @post = Post.find params[:id]
      @comment = Comment.new
      @wall = Wall.find(params[:wall_id])
    else
      redirect_to '/signin'
    end
  end

  def new
    if session[:id]
      @wall = Wall.find params[:wall_id]
      @post = Post.new
    else
      redirect_to '/signin'
    end
  end

  def create
    @wall = Wall.find params[:wall_id]
    @post = @wall.posts.new(link: params[:post][:link], description: params[:post][:description], title: params[:post][:title], user_id: session[:id], wall_id: @wall.id )
    if @post.save
      redirect_to wall_post_path(@wall, @post)
    else
      render :new
    end
  end

  def edit
    if session[:id]
      @post = Post.find params[:id]
    else
      redirect_to '/signin'
    end
  end

  def update
    @post = Post.find params[:id]
    if @post.update_attributes params[:post]
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to root_path
  end
end