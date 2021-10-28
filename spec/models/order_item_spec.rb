require 'rails_helper'

RSpec.describe OrderItem, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @order = FactoryBot.create(:order)
    @genre = FactoryBot.create(:genre)
    @item = FactoryBot.create(:item)
  end
  
  context "全てのカラムが入力されている場合" do
    order = @order
    item = @item
    let!(:order_item) do
      OrderItem.new({ order_id: 1,item_id: 1,price: 1,amount: 1,making_status: 1 })
    end
    it '商品オーダーを保存できる' do
      expect(order_item).to be_valid
    end
  end
end