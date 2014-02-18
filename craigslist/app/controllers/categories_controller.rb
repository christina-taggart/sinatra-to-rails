class CategoriesController < ApplicationController

  def index # show all categories
    @categories = Category.all
  end

  def show # show category dashboard
    @category = Category.find(params[:id])
  end

  def new # create category
    @category = Category.new
  end

  def create # post to create category
    @category = Category.new(params[:category])
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:category_id])
    @post = Post.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to category_path(@category)
    else
      render :edit
    end
  end

  def destroy # delete category
    category = Category.find(params[:id])
    category.destroy
    redirect_to root_path
  end
end