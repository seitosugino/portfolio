class CategoriesController < ApplicationController
  before_action :customer_role, only: [:index]
  
  def index
    @categories = Category.all
    @category = Category.new
  end
  
  def show
    @categories = Category.all
    @category = Category.find(params[:id])
    @posts = @category.posts.search(params[:search]).page(params[:page]).per(8)
    @amount = @category.posts.count
  end
  
  def create
    @categories = Category.all
    @category = Category.new(category_params)
    if @category.save
      @categories = Category.all
    else
      @categories = Category.all
      render 'index'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      @categories = Category.all
      render 'index', notice: "ジャンルを更新しました"
    else
      render "edit"
    end
  end
  
  private
    def category_params
      params.require(:category).permit(:name)
    end
    
    def customer_role
      unless current_customer.role == true
        redirect_to root_path
      end
    end
  
end
