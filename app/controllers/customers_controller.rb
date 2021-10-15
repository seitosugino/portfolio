class CustomersController < ApplicationController
  before_action :logged_in_customer, only:[ :edit, :update, :create, :destroy]
  
  def index
    selection = params[:keyword]
    if request.fullpath.include?('keyword')
      @customers = Customer.sort(params[:keyword])
      @customers = Kaminari.paginate_array(@customers).page(params[:page]).per(10)
    else
      @customers = Customer.all.page(params[:page]).per(10)
    end
    
  end
  
  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts
    @items = @customer.items
    
    @currentCustomerEntry = Entry.where(customer_id: current_customer.id)
    @customerEntry = Entry.where(customer_id: @customer.id)
    unless @customer_id == current_customer.id
      @currentCustomerEntry.each do |cu|
        @customerEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      unless @isRoom
        @room = Room.new
        @entry = Entry.new
      end
    end
  end
  
  def following
    @title = "Following"
    @customer = Customer.find(params[:id])
    @customers = @customer.following
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @customer = Customer.find(params[:id])
    @customers = @customer.followers
    render 'show_follow'
  end
  
end
