require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    let!(:event) do
      Event.new({ customer_id: 1,title: 1,content: 1,start_time: 1 })
    end
    it 'メッセージを保存できる' do
      expect(event).to be_valid
    end
  end
end