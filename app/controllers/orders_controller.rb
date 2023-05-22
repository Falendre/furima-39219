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

  def not_purchased_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end
end
