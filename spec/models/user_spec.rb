require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    # ユーザー情報
    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end

    it 'emailadressが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end

    it 'メールアドレスは@を含む必要があること' do
      @user.email = '@ + email'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    it 'passwordが半角英数字混合であれば登録できること' do
      @user.password = "/\A[a-zA-Z0-9]+\z/"
      @user.password_confirmation = "/\A[a-zA-Z0-9]+\z/"
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it 'パスワードは確認用を含めて2回入力すること' do
      @user.password = nil
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end

    # 本人情報確認
    it 'お名前が、苗字と名前がそれぞれ必須であること' do
      @user.family_name = nil
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("お名前の、苗字と名前を入力してください")
    end

    it 'お名前が全角日本語でないと保存できないこと' do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("全角日本語で入力してください")
    end

    it 'お名前(カナ)が、名字と名前でそれぞれ必須であること' do
      @user.family_name_FURIGANA = nil
      @user.first_name_FURIGANA = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字と名前のフリガナを入力してください")
    end

    it 'お名前(カナ)はが全角(カナ)でないと保存できないこと' do
      @user.name_FURIGANA = "/\A[ァ-ヶー－]+\z/"
      @user.valid?
      expect(@user.errors.full_messages).to include("全角(カナ)で入力してください")
    end

    it '生年月日が空では登録できないこと' do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
  end
end
