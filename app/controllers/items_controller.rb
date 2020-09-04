class ItemsController < ApplicationController
  def index
  end

  def new
    @address = Prefecture.all
  end
  
  def show
    @item = Item.find(params[:id])
    @image = @item.images.first
    @images = @item.images
    @address = Prefecture.find_by(id: @item.prefecture_id)
    @seller = User.find_by(id: @item.seller_id)
  end
end