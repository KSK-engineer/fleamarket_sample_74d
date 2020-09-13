class ItemsController < ApplicationController
  before_action :set_parents, only: [:new, :create]

  def index
    @items = Item.limit(4).includes(:images).order('created_at DESC')

  end
  
  def new
    @address = Prefecture.all
    @item = Item.new
    @item.images.new
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

  def search
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          @childrens = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandChilds = Category.find(params[:children_id]).children
        end
      end
    end
  end

  def edit
  end

  

  def destroy

    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  
  end

  def show
    @item = Item.find(params[:id])
    @image = @item.images.first
    @images = @item.images
    @address = Prefecture.find(@item.prefecture_id)
    @seller = User.find(@item.seller_id)
    @category = Category.find(@item.category_id)
    @brand = Brand.find(@item.brand_id)
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
      :brands_id, 
      :category_id, 
      images_attributes:  [:src, :_destroy, :id]
    ).merge(seller_id: current_user.id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end