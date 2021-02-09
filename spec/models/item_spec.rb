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
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_id:未入力' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_id:未入力' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'delivery_price_id:未入力' do
        @item.delivery_price_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery price must be other than 1")
      end
      it 'prefecture_id:未入力' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "delivery_time_id:未入力" do
        @item.delivery_time_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery time must be other than 1")
      end
      it "price:300未満の数値入力" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
    end
  end
end