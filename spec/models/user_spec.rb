require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    # ユーザー情報
    it 'nicknameが空では登録できないこと' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailadressが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'メールアドレスは@を含む必要があること' do
      @user.email = '@ + email'
      @user.valid?
      expect(@user.errors.full_messages).to include("@ can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = "/\A[a-zA-Z0-9]+\z/"
      @user.password_confirmation = "/\A[a-zA-Z0-9]+\z/"
      expect(@user).to be_valid
    end

    it 'passwordが半角英数字混合であれば登録できること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it 'パスワードは確認用を含めて2回入力すること' do
      @user.email1 = nil
      @user.email2 = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    # 本人情報確認
    it 'ユーザー本名が、名字と名前がそれぞれ必須であること' do
      @user.family_name = nil
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family_Name & First_Name can't be blank")
    end

    it 'nameが全角日本語でないと保存できないこと' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('Name is invalid. Input full-width characters.')
    end

    it 'ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること' do
      @user.family_name_reading = nil
      @user.first_name_reading = nil
      @user.valid?
      expect(@user_donation.errors.full_messages).to include("Family_Name reading & First_Name reading can't be blank")
    end

    it 'ユーザー本名のフリガナはが全角(カナ)でないと保存できないこと' do
      @user.name_reading = "/\A[ァ-ヶー－]+\z/"
      @user.valid?
      expect(@user.errors.full_messages).to include('Name reading is invalid. Input full-width katakana characters.')
    end

    it '生年月日が空では登録できないこと' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth_Date can't be blank")
    end
  end
end
