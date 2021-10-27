require 'rails_helper'

RSpec.describe Contact, type: :model do
  context "全てのカラムが入力されている場合" do
    let!(:contact) do
      Contact.new({ name: 1,email: 1,phone_number: 1,subject: 1,message: 1, })
    end
    it 'お問い合わせを保存できる' do
      expect(contact).to be_valid
    end
  end
end