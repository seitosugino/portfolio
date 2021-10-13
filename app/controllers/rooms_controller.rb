class RoomsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @rooms = Room.all
    @customer = current_customer
    @currentEntries = current_customer.entries
    myRoomIds = []
    
    @currentCustomerEntry = Entry.where(customer_id: current_customer.id)
    @customerEntry = Entry.where(customer_id: @customer.id)
    unless @customer_id == current_customer.id
      @currentCustomerEntry.each do |cu|
        @customerEntry.each do |u|
          if cu.room_id == u.room_id then
            @roomId = cu.room_id
          end
        end
      end
    end
    
    @currentEntries.each do | entry |
      myRoomIds << entry.room.id
    end
    
    @anotherEntries = Entry.where(room_id: myRoomIds).where('customer_id != ?', @customer.id)
  end
  
  def create
    @room = Room.create
    @entry1 = Entry.create(room_id: @room.id, customer_id: current_customer.id)
    @entry2 = Entry.create(params.require(:entry).permit(:customer_id, :room_id).merge(room_id: @room.id))
    redirect_to room_path(@room.id)
  end
  
  def show
    @room = Room.find(params[:id])
    if Entry.where(customer_id: current_customer.id,room_id: @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
end
