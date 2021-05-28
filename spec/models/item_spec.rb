require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品情報の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '画像が空では保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では保存できないこと' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では保存できないこと' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが空では保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'conditionが空では保存できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Condition must be other than 1')
      end
      it 'shipChargeが空では保存できないこと' do
        @item.shipCharge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipcharge must be other than 1')
      end
      it 'shipAreaが空では保存できないこと' do
        @item.shipArea_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shiparea must be other than 0')
      end
      it 'shipDateが空では保存できないこと' do
        @item.shipDate_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipdate must be other than 1')
      end
      it 'sales_priceが空では保存できないこと' do
        @item.sales_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales price can't be blank")
      end
      it 'sales_priceは¥300未満では保存できないこと' do
        @item.sales_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price is invalid')
      end
      it 'sales_priceは¥9,999,999を超過すると保存できないこと' do
        @item.sales_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price is invalid')
      end
      it 'sales_priceは半角数字でなければ保存できないこと' do
        @item.sales_price = '５０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales price is invalid')
      end
    end
  end
end
