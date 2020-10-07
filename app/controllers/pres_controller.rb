class PresController < ApplicationController
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @pre_management = PreManagement.new
  end

  def new
    @pre_management = PreManagement.new
  end

  def create
    pre_management = PreManagement.new(pre_params)
    pay_item
    User.create(user_params(pre))
    Item.create(item_params(pre))
    redirect_to action: :index
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def pre_params
    params.require(:pre_management).permit(:house_code, :city, :house_address, :prefecture_id, :telephone).merge(user_id: current_user.id)
  end

  def user_params(pre)
    params.permit(:user_id).merge(user_id: user.id)
  end

  def item_params(pre)
    params.permit(:item_id).merge(user_id: user.id)
  end

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = "sk_test_5245e3fd7e4e18c37bcff5c3"
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
