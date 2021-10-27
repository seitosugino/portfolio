require 'rails_helper'

RSpec.describe Entry, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @room = FactoryBot.create(:room)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    room = @room
    let!(:entry) do
      Entry.new({ customer_id: 1,room_id: 1 })
    end
    it 'エントリーを保存できる' do
      expect(entry).to be_valid
    end
  end
end