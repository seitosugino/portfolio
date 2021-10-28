require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @category = FactoryBot.create(:category)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    category = @category
    let!(:post) do
      Post.new({ customer_id: 1,category_id: 1,title: 'tesuto',introduction: 'tesuto', title_image_id: open('./app/assets/images/no_image.jpg'), body: true, body_image_id: open('./app/assets/images/no_image.jpg'), url: 'tesuto', star: 1 })
    end
    it '商品を保存できる' do
      expect(post).to be_valid
    end
  end
end