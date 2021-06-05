require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @orderaddress = FactoryBot.build(:order_address)
  end

  context '内容に問題ない場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@orderaddress).to be_valid
    end
    it 'buildingは空でも保存できること' do
      @orderaddress.building = ''
      expect(@orderaddress).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'postal_codeが空だと保存できないこと' do
      @orderaddress.postal_code = ''
      @orderaddress.valid?
      expect(@orderaddress.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @orderaddress.postal_code = '1234567'
      @orderaddress.valid?
      expect(@orderaddress.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'shipAreaを選択していないと保存できないこと' do
      @orderaddress.ship_area_id = 1
      @orderaddress.valid?
      expect(@orderaddress.errors.full_messages).to include("Ship area can't be blank")
    end
    it 'tokenが空では保存できないこと' do
      @orderaddress.token = nil
      @orderaddress.valid?
      expect(@orderaddress.errors.full_messages).to include("Token can't be blank")
    end
    it 'userが紐付いていないと保存できないこと' do
      @orderaddress.user_id = nil
      @orderaddress.valid?
      expect(@orderaddress.errors.full_messages).to include("User can't be blank")
    end
    it 'itemが紐付いていないと保存できないこと' do
      @orderaddress.item_id = nil
      @orderaddress.valid?
      expect(@orderaddress.errors.full_messages).to include("Item can't be blank")
    end
  end
end
