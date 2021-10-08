class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :likes, dependent: :destroy
  is_impressionable counter_cache: true
  attachment :title_image
  attachment :body_image
  attachment :image
  acts_as_taggable
  
  def already_liked?(post)
    self.likes.exists?(post_id: post.id)
  end
  
  def avg_score
    unless self.rates.empty?
      rates.average(:star).round(1)
    else
      0.0
    end
  end
  
  def score_count
      rates.count
  end
  
  def liked_by?(customer)
    likes.where(customer_id: customer.id).exists?
  end
  
  def self.search(search)
    if search
      Post.where(['title LIKE ?', '%'+search+'%'])
    else
      Post.all
    end
  end

def self.sort(selection)
  case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'likes'
      return find(Like.group(:post_id).order(Arel.sql('count(post_id) desc')).pluck(:post_id))
    when 'dislikes'
      return find(Like.group(:post_id).order(Arel.sql('count(post_id) asc')).pluck(:post_id))
    when 'highrate'
      return find(Rate.group(:post_id).order('avg(star) desc').pluck(:post_id))
    when 'lowrate'
      return find(Rate.group(:post_id).order('avg(star) asc').pluck(:post_id))
  end
end
  
  
end
