class PreController < ApplicationController
  before_action :move_to_index

  def update
    if @item.update(pre_params)
      redirect_to root_path
    else
      render redirect_to item_path(@item.id)
    end
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def pre_params
    params.require(:pre).permit(:name).merge(user_id: current_user.id)
  end
end
