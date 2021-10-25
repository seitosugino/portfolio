require 'rails_helper'

RSpec.describe ItemRate, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @genre = FactoryBot.create(:genre)
    @item = FactoryBot.create(:item)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    item = @item
    let!(:item_rate) do
      ItemRate.new({ customer_id: 1,item_id: 1,star: 4.5,comment: 'tesuto' })
    end
    it 'レートを保存できる' do
      expect(item_rate).to be_valid
    end
  end
end
