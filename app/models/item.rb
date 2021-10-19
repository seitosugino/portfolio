class Item < ApplicationRecord
  belongs_to :customer
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  has_many :item_likes, dependent: :destroy
  has_many :item_rates, dependent: :destroy
  is_impressionable counter_cache: true
  attachment :item_image

  def taxin_price
    (price*1.10).round
  end

  def already_liked?(item)
    self.item_likes.exists?(item_id: item.id)
  end

  def liked_by?(customer)
    if id == nil
      item_likes.where(customer_id: customer.id).exists?
    end
  end

  def avg_score
    unless self.item_rates.empty?
      item_rates.average(:star).round(1)
    else
      0.0
    end
  end

  def score_count
      item_rates.count
  end

  def self.search(search)
    if search
      Item.where(['name LIKE ?', '%'+search+'%'])
    else
      Item.all
    end
  end

  def self.sort(selection)
    case selection
      when 'new'
        return all.order(created_at: :DESC)
      when 'old'
        return all.order(created_at: :ASC)
      when 'manybuys'
        return find(OrderItem.group(:item_id).order('count(item_id) desc').pluck(:item_id))
      when 'fewbuys'
        return find(OrderItem.group(:item_id).order('count(item_id) asc').pluck(:item_id))
      when 'manyimpressions'
        return Item.order('impressions_count desc')
      when 'fewimpressions'
        return Item.order('impressions_count asc')
      when 'likes'
        return find(ItemLike.group(:item_id).order('count(item_id) desc').pluck(:item_id))
      when 'dislikes'
        return find(ItemLike.group(:item_id).order('count(item_id) asc').pluck(:item_id))
      when 'highrate'
        return find(ItemRate.group(:item_id).order('avg(star) desc').pluck(:item_id))
      when 'lowrate'
        return find(ItemRate.group(:item_id).order('avg(star) asc').pluck(:item_id))
    end
  end
end