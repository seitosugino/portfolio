class RelationshipsController < ApplicationController
  
  def create
    @customer = Customer.find(params[:followed_id])
    current_customer.follow(@customer)
  end
  
  def destroy
    @customer = Relationship.find(params[:id]).followed
    current_customer.unfollow(@customer)
  end
end
