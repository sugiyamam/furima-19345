require 'rails_helper'

RSpec.describe BuysForm, type: :model do
  describe '購入情報の保存' do
    before do
      @buys_form = FactoryBot.build(:buys_form)
    end

    describe '商品出品機能'
    context '購入できる場合' do
      it 'すべての値が正しく入力されている場合' do
        expect(@buys_form).to be_valid
      end
      it 'building_nameは空でも購入可' do
        @buys_form.building_name = ''
        expect(@buys_form).to be_valid
      end
    end

    context '購入できない場合' do
      it 'tokenが空の場合' do
        @buys_form.token = nil
        @buys_form.valid?
        expect(@buys_form.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeが空の場合" do
        @buys_form.postal_code = ''
        @buys_form.valid?
        expect(@buys_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んでいる場合' do
        @buys_form.postal_code = '1234567'
        @buys_form.valid?
        expect(@buys_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していない場合' do
        @buys_form.prefecture_id = 1
        @buys_form.valid?
        expect(@buys_form.errors.full_messages).to include("Prefecture Select")
      end
      it 'municipalityは空の場合' do
        @buys_form.municipality = ''
        @buys_form.valid?
        expect(@buys_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'house_numberは空の場合' do
        @buys_form.house_number = ''
        @buys_form.valid?
        expect(@buys_form.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空の場合' do
        @buys_form.phone_number = ''
        @buys_form.valid?
        expect(@buys_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字の場合' do
        @buys_form.phone_number = '０９０１２３４５６７８'
        @buys_form.valid?
        expect(@buys_form.errors.full_messages).to include("Phone number Input only half-width number")
      end
      it 'item_idが空の場合' do
        @buys_form.item_id = ''
        @buys_form.valid?
        expect(@buys_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'user_idが空の場合' do
        @buys_form.user_id = ''
        @buys_form.valid?
        expect(@buys_form.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end