require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @category = FactoryBot.create(:category)
    @post = FactoryBot.create(:post)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    post = @post
    let!(:like) do
      Like.new({ customer_id: 1,post_id: 1 })
    end
    it '商品いいねを保存できる' do
      expect(like).to be_valid
    end
  end
end