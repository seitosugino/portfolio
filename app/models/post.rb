class Post < ApplicationRecord
  belongs_to :customer
  belongs_to :category
  has_many :likes, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :rates, dependent: :destroy
  has_many :likes, dependent: :destroy
  attachment :title_image
  attachment :body_image
  acts_as_taggable
  
  def self.search(search)
    if search
      Post.where(['title LIKE ?', '%'+search+'%'])
    else
      Post.all
    end
  end
  
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
  
  
end
