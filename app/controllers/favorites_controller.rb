class FavoritesController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    favorite = current_user.favorites.build(product_id: @product.id)
    favorite.save
  end

  def destroy
    @product = Product.find(params[:product_id])
    favorite = current_user.favorites.find_by(product_id: @product.id)
    favorite.destroy
  end
end
