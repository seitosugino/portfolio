require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @genre = FactoryBot.create(:genre)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    genre = @genre
    let!(:item) do
      Item.new({ customer_id: 1,genre_id: 1,name: 'tesuto',introduction: 'tesuto', price: 500, is_active: true, url: 'tesuto', item_image_id: open('./app/assets/images/no_image.jpg') })
    end
    it '商品を保存できる' do
      expect(item).to be_valid
    end
  end
  
end
