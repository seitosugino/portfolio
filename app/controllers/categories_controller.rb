class CategoriesController < ApplicationController
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @posts = @category.posts.search(params[:search]).page(params[:page]).per(8)
    @amount = @category.posts.count
  end
  
end
