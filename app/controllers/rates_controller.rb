class RatesController < ApplicationController
  before_action :login_check, only: [:show]

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
  
  def login_check
    unless customer_signed_in?
      flash[:alert] = "ログインしてください"
      redirect_to new_customer_session_path
    end
  end
end
