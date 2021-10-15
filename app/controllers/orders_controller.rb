class OrdersController < ApplicationController
  
  def index
    @orders= Order.where(customer_id: current_customer.id)
  end
  
  def new
    @address = Address.find_by(customer_id: params[:customer_id])
    @addresses = Address.where(customer_id: current_customer.id)
    @order = Order.new
  end

  def log
    @addresses = Address.where(customer_id: current_customer.id)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    total_price = []
    @cart_items.each do |cart_item|
      total_price << cart_item.item.taxin_price * cart_item.amount
    end
    @total_price= total_price.sum
    @total_payment= @total_price + 800

    @order= Order.new(order_params)
    cart_item_order = params[:order][:oter_address]
    if params[:order][:address_select] == "0"
      if cart_item_order.empty?
        flash.now[:alert1] = "選択肢の中から宛先を選んでください"
        render "new"
      else
        @order_postal_code = Address.find_by(id: params[:order][:other_address], customer_id: current_customer.id).postal_code
        @order_address = Address.find_by(id: params[:order][:other_address], customer_id: current_customer.id).address
        @order_name = Address.find_by(id: params[:order][:other_address], customer_id: current_customer.id).name
      end
    elsif params[:order][:address_select] == "1"
      @order_postal_code= @order.postal_code
      @order_address= @order.address
      @order_name= @order.name
      if @order_postal_code.blank? || @order_address.blank? || @order_name.blank?
        flash.now[:alert2] = "郵便番号,住所,宛名は全て入力してください"
        render "new"
      end
    end
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order_items = @order.order_items
    @order_item = OrderItem.find(params[:id])
  end

  def create
    order= Order.new(order_params)
    order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items

    if order.save
      @cart_items.each do |cart_item|
        @order_item = OrderItem.new
        @order_item.order_id = order.id
        @order_item.item_id = cart_item.item.id
        @order_item.amount = cart_item.amount
        @order_item.price = cart_item.amount * cart_item.item.taxin_price
        @order_item.save
      end
      @cart_items.destroy_all
      redirect_to thanks_orders_path(current_customer.id)
    else
    end
  end

  def thanks
  end

  def index
    @orders= Order.where(customer_id: current_customer.id)
  end

  def show
    @order= Order.find(params[:id])
    @orders= Order.where(customer_id: params[:customer_id])
    @order_items= OrderItem.where(order_id: @order.id)
    total_price= []
    @order_items.each do |order_item|
      total_price << order_item.item.taxin_price * order_item.amount
    end
    @total_price= total_price.sum
    @total_payment= @total_price + 800
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
  end

end
