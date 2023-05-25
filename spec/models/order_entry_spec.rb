require 'rails_helper'

RSpec.describe OrderEntry, type: :model do
  before do
    @order_entry= FactoryBot.build(:order_entry)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_entry).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_entry.user_id = 1
        expect(@order_entry).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_entry.item_id = 1
        expect(@order_entry).to be_valid
      end
      it '郵便番号が「3桁+ハイフン+4桁」の組み合わせであれば保存できる' do
        @order_entry.post_code = '123-4567'
        expect(@order_entry).to be_valid
      end
      it '都道府県が「---」以外かつ空でなければ保存できる' do
        @order_entry.prefecture_id = 2
        expect(@order_entry).to be_valid
      end
      it '市区町村が空でなければ保存できる' do
        @order_entry.town = '北海道'
        expect(@order_entry).to be_valid
      end
      it '番地が空でなければ保存できる' do
        @order_entry.address = '札幌１２３'
        expect(@order_entry).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_entry.building_name = nil
        expect(@order_entry).to be_valid
      end
      it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
        @order_entry.tel = 12_345_678_910
        expect(@order_entry).to be_valid
      end
    end

    context '配送先情報の保存ができないとき' do
      it 'user_idが空だと保存できない' do
        @order_entry.user_id = nil
        @order_entry.valid?
        expect(@order_entry.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_entry.item_id = nil
        @order_entry.valid?
        expect(@order_entry.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できないこと' do
        @order_entry.post_code = nil
        @order_entry.valid?
        expect(@order_entry.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できないこと' do
        @order_entry.post_code = 1_234_567
        @order_entry.valid?
        expect(@order_entry.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it '都道府県が「---」だと保存できないこと' do
        @order_entry.prefecture_id = 1
        @order_entry.valid?
        expect(@order_entry.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が空だと保存できないこと' do
        @order_entry.prefecture_id = nil
        @order_entry.valid?
        expect(@order_entry.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと保存できないこと' do
        @order_entry.town = nil
        @order_entry.valid?
        expect(@order_entry.errors.full_messages).to include("Town can't be blank")
      end
      it '番地が空だと保存できないこと' do
        @order_entry.address = nil
        @order_entry.valid?
        expect(@order_entry.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @order_entry.tel = nil
        @order_entry.valid?
        expect(@order_entry.errors.full_messages).to include("Tel can't be blank")
      end
      it '電話番号にハイフンがあると保存できないこと' do
        @order_entry.tel = '123 - 1234 - 1234'
        @order_entry.valid?
        expect(@order_entry.errors.full_messages).to include('Tel is invalid')
      end
      it '電話番号が12桁以上あると保存できないこと' do
        @order_entry.tel = 12345678910123123
        @order_entry.valid?
        expect(@order_entry.errors.full_messages).to include('Tel is invalid')
      end
      it 'トークンが空だと保存できないこと' do
        @order_entry.token = nil
        @order_entry.valid?
        expect(@order_entry.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
