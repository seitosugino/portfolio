class OrderItemsController < ApplicationController
  def update
    @item = Item.find(params[:id])
    if request.fullpath.include?('sell')
      @order_items = @item.order_items
    else
      @order_items = Item.where(customer_id: params[:id]).includes(order_items: [:order])
    end
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(order_item_params)
    if @order.order_items.count == @order.order_items.where(making_status: '発送完了').count
      @order.status = '発送済み'
      @order.save
    end
  end
  
  def order_item_params
    params.require(:order_item).permit(:making_status)
  end
end
