class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item
  
  def taxin_price
    (price*1.10).round
  end
end
