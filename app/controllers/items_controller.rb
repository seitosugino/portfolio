class ItemsController < ApplicationController
  before_action :ensure_customer, only: [:edit, :update]
  
  def index
    selection = params[:keyword]
    if params[:keyword]
      @items = Item.sort(params[:keyword])
      @items = Kaminari.paginate_array(@items).page(params[:page]).per(8)
    elsif params[:day]
      @items = Item.day(params[:day]).order(created_at: :desc).page(params[:page]).per(8)
    else
      @items = Item.search(params[:search]).page(params[:page]).per(8)
    end
    @genres = Genre.all
    @amount = @items.total_count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @like = ItemLike.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.customer_id = current_customer.id
    if @item.save!
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
  
  def rates
    @item = Item.find(params[:id])
    @rates = @item.item_rates
    @customer = Customer.where(id: params[:id])
    render 'show_rates'
  end

  private

    def item_params
      params.require(:item).permit(:item_image, :name, :introduction, :genre_id, :price, :is_active, :url)
    end
    
    def ensure_customer
      @customer = Customer.find(params[:id])
      unless @customer == current_customer
        redirect_to root_path
      end
    end
end
