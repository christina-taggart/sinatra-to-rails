class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.includes(:posts).find(params[:id])
    @posts = @category.posts
  end
end