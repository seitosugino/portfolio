require 'rails_helper'

RSpec.describe GroupPost, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @group = FactoryBot.create(:group)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    group = @group
    let!(:group_post) do
      GroupPost.new({ customer_id: 1,group_id: 1,content: 'tesuto' })
    end
    it '商品レートを保存できる' do
      expect(group_post).to be_valid
    end
  end
end