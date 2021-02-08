require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能'
    context 'うまくいく場合' do
      it 'プルダウンを選択すれば入力可能' do
          expect(@item).to be_valid
      end
    end
    
    context 'うまくいかない場合' do
      it 'image:ファイル未選択' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'name:未入力' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'description:未入力' do
        @item.email = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description is invalid")
      end
      it 'category_id:未入力' do
        @item.password = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_id:未入力' do
        @item.password = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'delivery_price_id:未入力' do
        @item.password = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery price can't be blank")
      end
      it 'prefecture_id:未入力' do
        @item.password = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "delivery_time_id:未入力" do
        @item.password = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time can't be blank")
      end
      it "price:未入力" do
        @item.password = 300
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end