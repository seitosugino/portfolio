class RatesController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @rate = Rate.new
  end
  
  def create
    @rate = Rate.new(rate_params)
    @rate.customer_id = current_customer.id
    if @rate.save
      redirect_to posts_path, notice: "ありがとうございました。"
    else
      redirect_to posts_path, notice: "レビュー投稿が失敗しました。"
    end
  end
  
  private
  def rate_params
    params.require(:rate).permit(:star, :comment, :post_id, :customer_id,)
  end
end
