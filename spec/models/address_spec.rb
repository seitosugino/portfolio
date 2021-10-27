require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    let!(:address) do
      Address.new({ customer_id: 1,name: 1,postal_code: 1,address: 1 })
    end
    it 'メッセージを保存できる' do
      expect(address).to be_valid
    end
  end
end