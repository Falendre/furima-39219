require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.create(:item)
    sleep(0.25)
  end

  describe '商品の出品登録' do
    context '出品登録ができる' do
      it '全ての入力事項が、入力されていれば保存できる' do
        expect(@item).to be_valid
      end
      it 'カテゴリーが「---」以外であれば保存できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it '商品の状態が「---」以外であれば保存できる' do
        @item.item_status_id = 2
        expect(@item).to be_valid
      end
      it '配送料の負担が「---」以外であれば保存できる' do
        @item.cost_id = 2
        expect(@item).to be_valid
      end
      it '発送元の地域が「---」以外であれば保存できる' do
        @item.prefecture_id = 2
        expect(@item).to be_valid
      end
      it '発送までの日数が「---」以外であれば保存できる' do
        @item.shopping_day_id = 2
        expect(@item).to be_valid
      end
      it '価格が半角数字で300円〜9,999,999円であれば保存できる' do
        @item.price = 300
        expect(@item).to be_valid
      end
    end

    context '出品ができない' do
      it 'ログインしている人でないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
      it '画像が1枚ないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空欄だと出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空欄だと出品できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが「---」だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態が「---」だと出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 1')
      end
      it '配送料の負担が「---」だと出品できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Cost must be other than 1')
      end
      it '発送元の地域が「---」だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '発送までの日数が「---」だと出品できない' do
        @item.shopping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping day must be other than 1')
      end
      it '価格が空欄だと出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円未満だと出品できない' do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が半角英数字以外だと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が、9,999,999円より大きいと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
    end
  end
end