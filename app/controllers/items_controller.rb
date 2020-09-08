class ItemsController < ApplicationController
  before_action :set_item, except: [:index, :new, :create]
  
  def index
    @items = Item.includes(:images).order('created_at DESC')
    @parents = Category.where(ancestry: nil)
  end
  
  def new
    @address = Prefecture.all
    @item = Item.new
    @item.images.new
    @parents = Category.all.order("id ASC").limit(13)
    @item.build_brand
  end
  
  def create
    
    @address = Prefecture.all
    @item = Item.new(item_params)

    if @item.save!
      redirect_to root_path, notice: "登録に成功しました"
    else
      render :new
    end

  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy

    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  
  end

  private
  
  def item_params
    params.require(:item).permit(
      :name, 
      :detail, 
      :prefecture_id, 
      :condition, 
      :delivery_fee, 
      :delivery_day, 
      :price, 
      :seller_id, 
      :buyer_id, 
      :brand_id, 
      :category_id, 
      images_attributes_id:  [:src, :_destroy, :id]
    )
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

end

