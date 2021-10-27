require 'rails_helper'

RSpec.describe Category, type: :model do
  context "全てのカラムが入力されている場合" do
    let!(:category) do
      Category.new({ name: 'その他' })
    end
    it 'カテゴリーを保存できる' do
      expect(category).to be_valid
    end
  end
end