class MessagesController < ApplicationController
  before_action :authenticate_customer!, only: [:create]
  before_action :set_room, only: [:create]
  
  def create
    @messages = @room.messages
    if Entry.where(customer_id: current_customer.id, room_id: params[:message][:room_id]).present?
      @message = Message.create(params.require(:message).permit(:customer_id, :content, :room_id).merge(customer_id: current_customer.id))
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def set_room
    @room = Room.find(params[:message][:room_id])
  end

end
