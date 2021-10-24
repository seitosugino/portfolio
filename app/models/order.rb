class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  
  validates :postal_code, {presence: true ,numericality: true, length: { is: 7 } }
  validates :address, {presence: true}
  validates :name, {presence: true}
  
  enum payment_method:{ "銀行振込": 0 }
  enum status: { "入金待ち":0, "入金確認": 1, "発送済み":2 }
  
  def self.sort(method)
    if method == '入金待ち'
      Order.where(status: 0)
    elsif method == '入金確認'
      Order.where(status: 1)
    elsif method == '発送完了'
      Order.where(status: 2)
    else
      Order.all
    end
  end
  
end
