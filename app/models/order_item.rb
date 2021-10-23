class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  enum making_status: { '発送準備中': 0, '発送完了': 1 }
  
  def taxin_price
    (price*1.10).round
  end
end
