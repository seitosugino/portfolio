class ItemRatesController < ApplicationController
  before_action :login_check, only: [:show]
  def show
    @item = Item.find(params[:id])
    @rate = ItemRate.new
  end
  
  def create
    @rate = ItemRate.new(rate_params)
    @rate.customer_id = current_customer.id
    if @rate.save!
      redirect_to items_path, notice: "ありがとうございました。"
    else
      redirect_to items_path, notice: "レビュー投稿が失敗しました。"
    end
  end
  
  private
  
  def rate_params
    params.require(:item_rate).permit(:star, :comment, :item_id, :customer_id,)
  end
  
  def login_check
    unless customer_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to new_customer_session_path
    end
  end
end
