class ItemLikesController < ApplicationController
  
  def create
    @item = Item.find(params[:item_id])
    like = current_customer.item_likes.new(item_id: @item.id)
    like.save
  end

  def destroy
    @item = Item.find(params[:item_id])
    like = current_customer.item_likes.find_by(item_id: @item.id)
    like.destroy
  end
end
