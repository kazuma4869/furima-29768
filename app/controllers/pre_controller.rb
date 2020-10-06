class PreController < ApplicationController
  before_action :move_to_index

  
  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
end
