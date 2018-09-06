class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.add_favorite(micropost)
    flash[:success] = 'お気に入りに追加しました。'
    redirect_back(fallback_location: root_url)
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.remove_favorite(micropost)
    flash[:success] = 'お気に入りから削除しました。'
    redirect_back(fallback_location: root_url)
  end
end
