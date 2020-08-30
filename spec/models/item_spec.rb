require 'rails_helper'

# 出品ができる場合のコードも作る
RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

  describe '商品の出品' do
    context "商品が出品できる場合" do
      it '全て正常' do
        expect(@item.valid?).to eq true
      end
      it "価格の範囲が、¥300以上なら登録できること" do
        @item.price = 300
        @item.price_confirmation = 300
        expect(@item).to be_valid
      end
      it "価格の範囲が、¥¥9,999,999以下なら登録できること" do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context "商品が出品できない場合" do
      it "商品画像が空では登録できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が空では登録できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "カテゴリーが空では登録できないこと" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が空では登録できないこと" do
        @item.status = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の負担が空では登録できないこと" do
        @item.fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end
      it "発送元の地域が空では登録できないこと" do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数が空では登録できないこと" do
        @item.scheduled = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled can't be blank")
      end
      it "価格が空では登録できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格の範囲が、¥300以下なら登録できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
      it "価格の範囲が、¥¥9,999,999以上なら登録できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
      end
    end
  end
end