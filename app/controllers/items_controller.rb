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
    @address = Prefecture.find(@item.prefecture_id)
    @seller = User.find(@item.seller_id)
  end
end