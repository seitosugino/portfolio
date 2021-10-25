require 'rails_helper'

RSpec.describe Rate, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @post = FactoryBot.create(:post)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    post = @post
    let!(:rate) do
      Rate.new({ customer_id: 1,post_id: 1,star: 4.5,comment: 'tesuto' })
    end
    it 'レートを保存できる' do
      expect(rate).to be_valid
    end
  end
end
