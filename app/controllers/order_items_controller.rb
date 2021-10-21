class OrderItemsController < ApplicationController
  def update
    @item = Item.find(params[:id])
    @order_items = @item.order_items
    @order_item = OrderItem.find(params[:id])
    @order_item = OrderItem.update(order_item_params)
  end
  
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end
