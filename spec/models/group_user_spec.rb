require 'rails_helper'

RSpec.describe GroupUser, type: :model do
  before do
    @customer = FactoryBot.create(:customer)
    @group = FactoryBot.create(:group)
  end
  
  context "全てのカラムが入力されている場合" do
    customer = @customer
    group = @group
    let!(:group_user) do
      GroupUser.new({ customer_id: 1,group_id: 1 })
    end
    it 'グループユーザーを保存できる' do
      expect(group_user).to be_valid
    end
  end
end