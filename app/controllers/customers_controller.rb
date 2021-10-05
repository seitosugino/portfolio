class CustomersController < ApplicationController
  before_action :logged_in_customer, only:[ :edit, :update, :create, :destroy]
  
  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def following
    @title = "Following"
    @customer = Customer.find(params[:id])
    @customers = @customer.following
    render 'show_follow'
  end
  
  def followers
    @title = "Following"
    @customer = Customer.find(params[:id])
    @customers = @customer.followers
    render 'show_follow'
  end
  
end
