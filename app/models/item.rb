class Item < ApplicationRecord
  belongs_to :customer
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
  is_impressionable counter_cache: true
  attachment :item_image
  
  def taxin_price
    (price*1.10).round
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
    end
  end
end