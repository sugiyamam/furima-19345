require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー管理機能'
    context 'うまくいく場合' do
      it 'フォームを入力すれば登録可能' do
        expect(@user).to be_valid
      end
    end

    context 'うまくいかない場合' do
      it 'nickname:未入力' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'email:未入力' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'email:@未入力' do
        @user.email = 'ああAa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合は登録不可' do
        user = FactoryBot.create(:user)
        another_user = FactoryBot.build(:user, email: user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'password:未入力' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password:英語のみで入力不可' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password:数字のみで入力不可' do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password:全角のみで入力不可' do
        @user.password = 'あああAAA'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが存在してもpassword_confirmationがない場合は登録不可' do
        @user.password = 'あああAAA'
        @user.password_confirmation = 'abc000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下であれば登録不可' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'family_name:未入力' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'family_name:漢字ひらがなカタカナ以外入力不可' do
        @user.family_name = 'Aa00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width kanji hiragana katakana characters')
      end
      it 'first_name:未入力' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_name:漢字ひらがなカタカナ以外入力不可' do
        @user.family_name = 'Aa00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid. Input full-width kanji hiragana katakana characters')
      end
      it 'kana_family_name:未入力' do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end
      it 'kana_family_name:全角カタカナ以外入力不可' do
        @user.kana_family_name = 'Aa00'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family name is invalid. Input full-width katakana characters')
      end
      it 'kana_name:未入力' do
        @user.kana_family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana family name can't be blank")
      end
      it 'kana_name:全角カタカナ以外入力不可' do
        @user.kana_family_name = 'あAa0'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana family name is invalid. Input full-width katakana characters')
      end
      it 'date_of_birthがない場合は登録不可' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
