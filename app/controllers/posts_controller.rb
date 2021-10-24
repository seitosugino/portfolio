class PostsController < ApplicationController
  
  def top
    @posts = Post.all
    @title = '閲覧数の多い記事ランキング'
   

  end
  
  def rank
    if params[:keyword] == 'rank1'
      @posts = Post.order('impressions_count desc').limit(4)
      @title = '閲覧数の多い記事ランキング'
    elsif params[:keyword] == 'rank2'
      @posts = Post.find(Rate.group(:post_id).order('avg(star) desc').limit(4).pluck(:post_id))
      @title = '平均評価の高い記事ランキング'
    elsif params[:keyword] == 'rank3'
      @posts = Post.find(Like.group(:post_id).order('count(likes.id) desc').limit(4).pluck(:post_id))
      @title = 'いいね数の多い記事ランキング'
    elsif params[:keyword] == 'rank4'
      @posts = Item.find(Rate.group(:item_id).order('avg(star) desc').limit(4).pluck(:item_id))
      @title = '平均評価の高い商品ランキング'
    elsif params[:keyword] == 'rank5'
      @posts = Item.find(ItemLike.group(:item_id).order('count(item_likes.id) desc').limit(4).pluck(:item_id))
      @title = 'いいね数の多い商品ランキング'
    end
    
  end
  
  def about
  end
  
  def index
    selection = params[:keyword]
    if params[:tag]
      @posts = Post.tagged_with(params[:tag]).order(created_at: :desc).page(params[:page]).per(8)
    elsif params[:keyword]
      @posts = Post.sort(params[:keyword])
      @posts = Kaminari.paginate_array(@posts).page(params[:page]).per(8)
    else
      @posts = Post.search(params[:search]).order(created_at: :desc).page(params[:page]).per(8)
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
    
    @categories = Category.all
  end
  
  def show
    @post = Post.find(params[:id])
    @tags = @post.tag_counts_on(:tags)
    @like = Like.new
    @post_comment = PostComment.new
    impressionist(@post, nil,  unique: [:ip_address])
  end
  
  def new
    @post = Post.new
    @tags = ActsAsTaggableOn::Tag.all
  end
  
  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      flash[:notice] = "#{@post.title}を投稿しました"
      redirect_to post_path(@post)
    else
      render :new
    end
  end
  
  def edit
    @post = Post.find(params[:id])
    @tags = ActsAsTaggableOn::Tag.all
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "記事を更新しました。"
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
  
  def rates
    @post = Post.find(params[:id])
    @rates = @post.rates
    @customer = Customer.where(id: params[:id])
    render 'show_rates'
  end
  
  private
  
  def post_params
    params.require(:post).permit(:customer_id, :category_id, :title, :introduction, :title_image, :body, :body_image, :url, :original, :star, :tag_list)
  end
end

