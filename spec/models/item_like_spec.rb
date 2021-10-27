require 'rails_helper'

RSpec.describe ItemLike, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @genre = FactoryBot.create(:genre)
    @item = FactoryBot.create(:item)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    item = @item
    let!(:item_like) do
      ItemLike.new({ customer_id: 1,item_id: 1 })
    end
    it '商品いいねを保存できる' do
      expect(item_like).to be_valid
    end
  end
end