require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_order).to be_valid
    end
    it 'tokenが空だと保存できないこと' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("token can't be blank")
    end
    it '郵便番号が空だと保存できないこと' do
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end
    it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_order.postal_code = '1234567'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end
    it '都道府県を選択していないと保存できないこと' do
      @user_order.prefecture_id = 0
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
    end
    it '市町村が空だと保存できないこと' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end
    it '番地が空だと保存できないこと' do
      @user_order.addresses = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Addresses can't be blank")
    end
    it '建物名は空でも保存できること' do
      @user_order.building_name = nil
      expect(@user_order).to be_valid
    end
    it '電話番号が空だと保存できないこと' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号の情報に半角のハイフンが含まれていると保存できない' do
      @user_order.phone_number = "00000000000"
      @user.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is invalid. Include! hyphen(-)")
    end
    it "電話番号が12文字以上だと登録できないこと" do
      @user_order.phone_number = "000000000000"
      @user.valid?
      expect(@user_order.errors.full_messages).to include("Phone number is too lomg (maximum is 11 characters)")
    end
  end
end
