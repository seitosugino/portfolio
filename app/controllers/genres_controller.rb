class GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @items = @genre.items.page(params[:page]).per(8)
    @amount = @genre.items.count
  end
    
end
