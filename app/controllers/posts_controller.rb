class PostsController < ApplicationController
  
  def top
    @posts = Post.all
  end
  
  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).page(params[:page]).per(8)
    else
      @posts = Post.search(params[:search]).page(params[:page]).per(8)
    end
    
    @tags = ActsAsTaggableOn::Tag.all
      if @tag = params[:tag]
        @post =Post.tagged_with(params[:tag])
      end
      
    if params[:tag]
      @amount = Post.tagged_with(params[:tag]).count
    else
      @amount = @posts.total_count
    end
  end
  
  def show
    @post = Post.find(params[:id])
    @tags = @post.tag_counts_on(:tags)
  end
  
  def new
    @post = Post.new
    @tags = ActsAsTaggableOn::Tag.all
  end
  
  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save!
      flash[:notice] = "#{@post.title}を投稿しました"
      redirect_to post_poth(@post)
    else
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post = Post.update(post_params)
      flash[:notice] = "記事を更新しました。"
      redirect_to post_poth(@post)
    else
      render :edit
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:customer_id, :title, :introduction, :title_image, :body, :body_image, :url, :original, :star, :tag_list)
  end
end
