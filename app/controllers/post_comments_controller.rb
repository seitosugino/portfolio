class PostCommentsController < ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    comment = PostComment.new(post_comment_params)
    comment.customer_id = current_customer.id
    comment.post_id = post.id
    if comment.save!
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    PostComment.find_by(id: params[:id],post_id: params[:post_id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
  
end
