class PostCommentsController < ApplicationController
  
  def create
    @comment = PostComment.new(post_comment_params)
    @comment.customer_id = current_customer.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @comment = PostComment.find(post_id: params[:post_id],customer_id: current_customer.id)
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
