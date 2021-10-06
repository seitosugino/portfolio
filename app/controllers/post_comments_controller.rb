class PostCommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = PostComment.new
    @comment.customer_id = current_customer.id
    @comment.post_id = @post.id
    if @comment.save!
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
  
end
