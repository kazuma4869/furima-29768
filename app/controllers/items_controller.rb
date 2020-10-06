class ItemsController < ApplicationController
  #before_action :authenticate_user!
  #before_action :user_signed_in
  before_action :find_params,except:[:index]
  before_action :move_to_index,except: [:index,:show]

  def index
    @items = Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render "new"
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect_to new_user_session_path
    end
  end

  def show
  end
  
  private
  def find_params
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name,:image, :price, :explain, :category_id, :status_id, :fee_id, :prefecture_id, :shipment_id).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end


end
