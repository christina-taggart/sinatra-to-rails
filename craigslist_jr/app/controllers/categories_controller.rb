class CategoriesController < ApplicationController

  def index
    @categories = Category.order('name asc')
  end

  def show
    @category = Category.includes(:posts).find(params[:id])
    @posts = @category.posts.order('created_at desc')
  end
end