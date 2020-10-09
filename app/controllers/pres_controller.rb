class PresController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :select_item, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    unless current_user.id == @item.user_id
      @pre_management = PreManagement.new
    else
      redirect_to root_path
    end
  end

  def new
    @pre_management = PreManagement.new
  end

  def create
    @pre_management = PreManagement.new(pre_params)
    if @pre_management.valid?
      pay_item
      @pre_management.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def pre_params
    params.require(:pre_management).permit(:house_code, :city, :house_address, :house_name, :prefecture_id, :telephone, :user_id, :token).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: pre_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def select_item
    @item = Item.find(params[:item_id])
  end

end
