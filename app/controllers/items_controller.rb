class ItemsController < ApplicationController
  before_action :set_parents, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
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
  
    if @item.save
      redirect_to root_path, notice: "商品を出品しました"
    else
      redirect_to new_item_path,notice: "未入力の項目があります"
      
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
    @item = Item.find(params[:id])
    @item.images.new
    grandchild_category = Category.find(@item.category_id)
    child_category = grandchild_category.parent
    @category = Category.find(@item.category_id)
    @images = Image.where(item_id: params[:id])

    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end


  def update
    if @item.update(item_params)
      redirect_to item_path, notice: '商品内容を更新しました'
    else
      redirect_to edit_item_path, notice: '画像を１枚以上入れて下さい'
    end
  end
  

  def destroy

    if @item.destroy
      redirect_to root_path, notice: '商品を削除しました'
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