class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @category = @post.category
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.update_attributes(params[:post])
    if @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def delete
    post = Post.find(params[:id])
    category = post.category
    post.destroy
    redirect_to category_path(category)
  end

end