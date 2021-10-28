require 'rails_helper'

RSpec.describe PostComment, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @category = FactoryBot.create(:category)
    @post = FactoryBot.create(:post)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    post = @post
    let!(:post_comment) do
      PostComment.new({ customer_id: 1,post_id: 1,comment: 1 })
    end
    it 'コメントを保存できる' do
      expect(post_comment).to be_valid
    end
  end
end