class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    redirect_to category_posts_path(Category.find(params[:id]))
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy
    category = Category.find(params[:id])
    if category.destroy
      redirect_to root_path
    else
      redirect_to category_posts_path(category)
    end
  end
end