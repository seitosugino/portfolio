require 'rails_helper'

RSpec.describe CartItem, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @genre = FactoryBot.create(:genre)
    @item = FactoryBot.create(:item)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    item = @item
    let!(:cart_item) do
      CartItem.new({ customer_id: 1,item_id: 1,amount: 4.5 })
    end
    it '商品レートを保存できる' do
      expect(cart_item).to be_valid
    end
  end
end