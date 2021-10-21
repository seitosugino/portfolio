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
    if id == nil
      likes.where(customer_id: customer.id).exists?
    end
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
        return find(Like.group(:post_id).order('count(post_id) desc').pluck(:post_id))
      when 'dislikes'
        return find(Like.group(:post_id).order('count(post_id) asc').pluck(:post_id))
      when 'highrate'
        return find(Rate.group(:post_id).order('avg(star) desc').pluck(:post_id))
      when 'lowrate'
        return find(Rate.group(:post_id).order('avg(star) asc').pluck(:post_id))
      when 'manyimpressions'
        return Post.order('impressions_count desc')
      when 'fewimpressions'
        return Post.order('impressions_count asc')
    end
  end
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } 
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  scope :created_2day_ago, -> { where(created_at: 2.day.ago.all_day) }
  scope :created_3day_ago, -> { where(created_at: 3.day.ago.all_day) }
  scope :created_4day_ago, -> { where(created_at: 4.day.ago.all_day) }
  scope :created_5day_ago, -> { where(created_at: 5.day.ago.all_day) }
  scope :created_6day_ago, -> { where(created_at: 6.day.ago.all_day) }
  scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
  scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) }
end
