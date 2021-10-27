require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @room = FactoryBot.create(:room)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    room = @room
    let!(:message) do
      Message.new({ customer_id: 1,room_id: 1,content: 1 })
    end
    it 'メッセージを保存できる' do
      expect(message).to be_valid
    end
  end
end