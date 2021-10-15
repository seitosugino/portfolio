class ItemsController < ApplicationController
  def index
    @items = Item.search(params[:search]).page(params[:page]).per(8)
    @amount = @items.total_count
  end
  
  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "#{@item.name}を登録しました"
      redirect_to item_path(@item)
    else
      render :new
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "商品内容を変更しました"
      redirect_to item_path(@item)
    else
      render :edit
    end
  end
  
  private
  
  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :price, :is_active, :url)
  end
end