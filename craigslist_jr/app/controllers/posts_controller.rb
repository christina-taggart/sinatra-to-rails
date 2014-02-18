class PostsController < ApplicationController
  def index
    @posts = Post.find_by_category_id(params[:category_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @category = Category.find(params[:category_id])
    @post = @category.posts.build
  end

  def create
    @category = Category.find(params[:category_id])
    @post = @category.posts.build(params[:post])
    if @category.save
      redirect_to @category
    else
      redirect_to new_category_post_path(@category)
    end
  end

  def edit
  end

  def update
  end

  def delete
  end
end