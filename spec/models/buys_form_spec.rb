require 'rails_helper'

RSpec.describe BuysForm, type: :model do
  describe '購入情報の保存' do
    before do
      @buys_form = FactoryBot.build(:buys_form)
    end

    it "すべての値が正しく入力されていれば保存できること" do
      expect(@buys_form).to be_valid
    end
    it "tokenがあれば保存ができること" do
      expect(@buys_form).to be_valid
    end
    it "tokenが空では登録できないこと" do
      @buys_form.token = nil
      @buys_form.valid?
      expect(@buys_form.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空だと保存できないこと' do
      @buys_form.postal_code = ''
      @buys_form.valid?
      expect(@buys_form.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @buys_form.postal_code = '1234567'
      @buys_form.valid?
      expect(@buys_form.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it 'prefectureを選択していないと保存できないこと' do
      @buys_form.prefecture_id = 1
      @buys_form.valid?
      expect(@buys_form.errors.full_messages).to include("Prefecture Select")
    end
    it 'municipalityは空だと保存できないこと' do
      @buys_form.municipality = ''
      @buys_form.valid?
      expect(@buys_form.errors.full_messages).to include("Municipality can't be blank")
    end
    it 'house_numberは空だと保存できないこと' do
      @buys_form.house_number = ''
      @buys_form.valid?
      expect(@buys_form.errors.full_messages).to include("House number can't be blank")
    end
    it 'building_nameは空でも保存できること' do
      @buys_form.building_name = ''
      expect(@buys_form).to be_valid
    end
    it 'phone_numberが空だと保存できないこと' do
      @buys_form.phone_number = ''
      @buys_form.valid?
      expect(@buys_form.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが全角数字だと保存できないこと' do
      @buys_form.phone_number = '０９０１２３４５６７８'
      @buys_form.valid?
      expect(@buys_form.errors.full_messages).to include("Phone number Input only half-width number")
    end
  end
end