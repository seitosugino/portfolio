class EventsController < ApplicationController
  
  def show
    @event = Event.find(params[:id])
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event = Event.new(event_params)
    @event.customer_id = current_customer.id
    if @event.save!
      flash[:notice] = "#{@event.title}を登録しました"
      redirect_to calendar_customer_path(current_customer)
    else
      render :new
    end
  end
  
  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @events = Event.where(customer_id: current_customer.id)
    if @event.update(event_params)
      flash[:notice] = "#{@event.title}を登録しました"
      redirect_to calendar_customer_path(current_customer)
    else
      render :edit
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:notice] = "#{@event.title}を削除しました"
      redirect_to calendar_customer_path(current_customer)
    else
      render :edit
    end
  end
    
  private
    
  def event_params
    params.require(:event).permit(:title, :start_time, :customer_id, :content)
  end
end
