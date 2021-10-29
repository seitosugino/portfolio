class CustomersController < ApplicationController
  
  def index
    selection = params[:keyword]
    if request.fullpath.include?('keyword')
      @customers = Customer.sort(params[:keyword])
      @customers = Kaminari.paginate_array(@customers).page(params[:page]).per(10)
    else
      @customers = Customer.search(params[:search]).order(created_at: :desc).page(params[:page]).per(10)
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
    @data = [[Date.today.ago(6.days), @posts.created_6day_ago.count],
    [Date.today.ago(5.days), @posts.created_5day_ago.count],
    [Date.today.ago(4.days), @posts.created_4day_ago.count],
    [Date.today.ago(3.days), @posts.created_3day_ago.count],
    [Date.today.ago(2.days), @posts.created_2day_ago.count],
    [Date.yesterday, @posts.created_yesterday.count],
    [Date.today, @posts.created_today.count]]
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
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "プロフィールを更新しました。"
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end
  
  def calendar
    @customer = Customer.find(params[:id])
    @events = Event.where(customer_id: @customer.id)
    @event = Event.new
  end
  
  def matchers
    @customers = current_customer.matchers
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:image, :name, :introduction)
  end
  
end
