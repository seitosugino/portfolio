require 'rails_helper'

RSpec.describe Relationship, type: :model do
  context "全てのカラムが入力されている場合" do
    let!(:relationship) do
      Relationship.new({ follower_id: 1,followed_id: 1 })
    end
    it 'ジャンルを保存できる' do
      expect(relationship).to be_valid
    end
  end
end