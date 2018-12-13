class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    micropost.good(current_user)
    flash[:success] = 'いいねした'
    #redirect_to current_user
    redirect_to(:back)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    micropost.ungood(current_user)
    flash[:success] = 'いいね外した'
    #redirect_to current_user
    redirect_to(:back)
  end
end
