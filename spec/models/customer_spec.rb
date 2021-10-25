require 'rails_helper'

RSpec.describe Customer, type: :model do
  before do 
    @customer = build(:customer)
  end

  describe 'バリデーション' do
    it 'nameとemailどちらも値が設定されていれば、OK' do
    end

    it 'nameが空だとNG' do
      @customer.name = ''
    end

    it 'emailが空だとNG' do
      @customer.email = ''
    end
  end
end
