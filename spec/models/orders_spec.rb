require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    let!(:order) do
      Order.new({ customer_id: 1,postal_code: 1,address: 1,name: 1,shipping_cost: 1,total_payment: 1,payment_method: 1,status: 1 })
    end
    it 'オーダーを保存できる' do
      expect(order).to be_valid
    end
  end
end