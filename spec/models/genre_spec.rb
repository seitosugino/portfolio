require 'rails_helper'

RSpec.describe Genre, type: :model do
  context "全てのカラムが入力されている場合" do
    let!(:genre) do
      Genre.new({ name: 'その他' })
    end
    it 'ジャンルを保存できる' do
      expect(genre).to be_valid
    end
  end
end
