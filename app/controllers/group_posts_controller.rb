class GroupPostsController < ApplicationController

  def create
    @group = Group.find_by(id: params[:group_id])
    @group_post = GroupPost.new(group_post_params)
    @group_post.customer_id = current_customer.id
    if @group_post.save!
      redirect_to group_path(@group_post.group_id)
    end
  end
  
  private
  def group_post_params
    params.require(:group_post).permit(:group_id, :customer_id,:content)
  end
end
