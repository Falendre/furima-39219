class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :not_purchased_item, only: [:index, :create]

  def index
    @order_entry = OrderEntry.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_entry = OrderEntry.new(order_params)
    if @order_entry.valid?
      pay_item
      @order_entry.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :town, :address, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_bcc9331eeab0863395ca3b95"
    Payjp::Charge.create(
      amount: @item.price,        # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end

  def not_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end
