require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとname、email、passwordとpassword_confirmation、birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordは半角英数字混合であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'name_kanji_lastが空では登録できない' do
        @user.name_kanji_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji last can't be blank",
                                                      'Name kanji last is invalid. Input full-width characters.')
      end
      it 'name_kanji_firstが空では登録できない' do
        @user.name_kanji_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanji first can't be blank",
                                                      'Name kanji first is invalid. Input full-width characters.')
      end
      it 'name_furigana_lastが空では登録できない' do
        @user.name_furigana_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name furigana last can't be blank",
                                                      'Name furigana last is invalid. Input full-width katakana characters.')
      end
      it 'name_furigana_firstが空では登録できない' do
        @user.name_furigana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name furigana first can't be blank",
                                                      'Name furigana first is invalid. Input full-width katakana characters.')
      end
      it 'name_kanji_lastは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.name_kanji_last = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kanji last is invalid. Input full-width characters.')
      end
      it 'name_kanji_firstは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.name_kanji_first = 'hanako'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kanji first is invalid. Input full-width characters.')
      end
      it 'name_furigana_lastは全角（カタカナ）でなければ登録できない' do
        @user.name_furigana_last = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name furigana last is invalid. Input full-width katakana characters.')
      end
      it 'name_furigana_firstは全角（カタカナ）でなければ登録できない' do
        @user.name_furigana_first = 'ﾊﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name furigana first is invalid. Input full-width katakana characters.')
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは@が含まれないと登録できない' do
        @user.email = 'test/test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角数字のみの場合は登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input both letters and numbers in half-width characters.')
      end
      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input both letters and numbers in half-width characters.')
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = 'パスワード'
        @user.password_confirmation = 'パスワード'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid. Input both letters and numbers in half-width characters.')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
