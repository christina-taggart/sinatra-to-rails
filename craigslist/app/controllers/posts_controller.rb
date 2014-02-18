class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @category = @post.category
  end

  def new
    @category = Category.find(params[:category_id])
    @post = @category.posts.build
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.build(params[:post])
    if @post.save
      redirect_to category_post_path(@category, @post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
    @post = Post.update_attributes(params[:post])
    if @post.save
      redirect_to category_post_path(@category, @post)
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