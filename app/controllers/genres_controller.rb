class GenresController < ApplicationController
  before_action :customer_role, only: [:index]
  
  def index
    @genres = Genre.all
    @genre = Genre.new
  end
  
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = @genre.items.page(params[:page]).per(8)
    @amount = @genre.items.count
  end
  
  def create
    @genres = Genre.all
    @genre = Genre.new(genre_params)
    if @genre.save
      @genres = Genre.all
    else
      @genres = Genre.all
      render 'index'
    end
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      @genres = Genre.all
      render 'index', notice: "ジャンルを更新しました"
    else
      render "edit"
    end
  end
  
  private
    def genre_params
      params.require(:genre).permit(:name)
    end
    
    def customer_role
      unless current_customer.role == true
        redirect_to root_path
      end
    end
end
