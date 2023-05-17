class Item < ApplicationRecord

  with_options presence: true do
    validates :user
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :cost_id
    validates :prefecture_id
    validates :shipping_day_id
    # 300円以上、9,999,999円以下、半角数字でなければ入力できない
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
