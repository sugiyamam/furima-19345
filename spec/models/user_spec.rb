require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do

  before do
    @user = FactoryBot.build(:user)
  end

    # 1
    it 'nickname:必須' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    # 2
    it 'email:必須' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    #3
    it '重複したemailが存在する場合は登録不可' do
      user = FactoryBot.create(:user)
      another_user = FactoryBot.build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    # 4
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'あああAAA'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    # 5
    it "passwordが存在してもpassword_confirmationがない場合は登録不可" do
      @user.password = 'あああAAA'
      @user.password_confirmation = 'abc000'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
    end

    # 6
    it "passwordが6文字以上であれば登録可能" do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    # 7
    it "passwordが5文字以下であれば登録不可" do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    # 8
    it "family_nameがない場合は登録不可" do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    # 9
    it "first_nameがない場合は登録不可" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    # 10
    it "kana_family_nameがない場合は登録不可" do
      @user.kana_family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana family name can't be blank")
    end

    # 11
    it "kana_nameがない場合は登録不可" do
      @user.kana_first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first name can't be blank")
    end

    # 12
    it "date_of_birthがない場合は登録不可" do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
  end
end