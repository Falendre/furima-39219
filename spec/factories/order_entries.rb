FactoryBot.define do
  factory :order_entry do
    before do
      # ユーザーのデータを生成し、DBに保存
      user = FactoryBot.create(:user)
      # 商品のデータを生成し、DBに保存
      item = FactoryBot.create(:item)
      # フォームオブジェクトのインスタンスを生成
      @order_entry = FactoryBot.build(:order_entry, user_id: user.id, item_id: item.id)
    end
    post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    town { Faker::Address.city }
    address { Faker::Address.street_address }
    building_name { Faker::Address.street_address }
    tel { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end