class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # 各テーブルのアソシエーション
  belongs_to :user
  has_one_attached :image
  # ActiveHashのアソシエーション
  belongs_to :category
  belongs_to :item_status
  belongs_to :cost
  belongs_to :prefecture
  belongs_to :shopping_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :cost_id
    validates :prefecture_id
    validates :shopping_day_id
    # 300円以上、9,999,999円以下、半角数字でなければ入力できない
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  end

  # 「---」の時は保存不可
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :prefecture_id
    validates :item_status_id
    validates :cost_id
    validates :shopping_day_id
  end
end
