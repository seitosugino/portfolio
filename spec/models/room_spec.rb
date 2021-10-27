require 'rails_helper'

RSpec.describe Room, type: :model do
  context "全てのカラムが入力されている場合" do
    let!(:room) do
      Room.new({ name: 'その他' })
    end
    it 'ルームを保存できる' do
      expect(room).to be_valid
    end
  end
end