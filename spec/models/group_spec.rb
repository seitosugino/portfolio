require 'rails_helper'

RSpec.describe Group, type: :model do
  context "全てのカラムが入力されている場合" do
    let!(:group) do
      Group.new({ name: 1,introduction: 1,image_id: open('./app/assets/images/no_image.jpg'),owner_id: 1 })
    end
    it 'お問い合わせを保存できる' do
      expect(group).to be_valid
    end
  end
end