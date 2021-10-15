class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy
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
end