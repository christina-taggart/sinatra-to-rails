class PostsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    @posts = @category.posts
  end

  def show
    @post = Post.find(params[:id])
    @category = @post.category
  end

  def edit
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to category_post_path(@post)
    else
      render :edit
    end
  end

  def new
    @category = Category.find(params[:category_id])
    @post = Post.new
  end

  def create
    params[:post][:edit_key] = Faker::Lorem.characters(char_count = 6)

    @category = Category.find(params[:category_id])
    @post = @category.posts.build(params[:post])
    if @category.save
      redirect_to category_post_path(@category, @post)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to category_posts_path(Category.find(params[:category_id]))
    else
      redirect_to category_post_path(@post)
    end
  end
end





