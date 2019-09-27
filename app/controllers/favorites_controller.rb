class FavoritesController < ApplicationController

  # skip_before_action
  #skip_before_action :login_forbided

  def create
    @favorite = current_user.favorites.new(picture_id: params[:picture_id])
    @favorite.save
    @picture = Picture.find(params[:picture_id])
    @favorite_count = Favorite.where(picture_id: @picture.id).count
    #binding.pry
    render 'index.js.slim'
    #redirect_to picture_path(@favorite.picture_id)
  end

  def destroy
    @favorite = current_user.favorites.find_by(picture_id: params[:id].to_i)
    @favorite.destroy
    @picture = Picture.find(params[:id])
    @favorite_count = Favorite.where(picture_id: @picture.id).count
    render 'index.js.slim'
    #redirect_to picture_path(@favorite.picture_id)
  end

end
