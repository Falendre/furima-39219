class OrderEntry
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :town, :address, :building_name, :tel, :token

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :town
    validates :address
    validates :tel, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Buyer.create(order_id: order.id, post_code: post_code, prefecture_id: prefecture_id, town: town, address: address, building_name: building_name, tel: tel)
  end
end