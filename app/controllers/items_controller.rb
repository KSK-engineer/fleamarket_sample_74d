class ItemsController < ApplicationController
  before_action :move_to_index, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_parents

  def index
    @items = Item.includes(:images).order('created_at DESC')

  end
  
  def new
    @address = Prefecture.all
    @item = Item.new
    @item.images.new
    @item.build_brand
    @category_parent_array = Category.where(ancestry: nil)
  end

  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(id: params[:parent_id], ancestry: nil).children
  end

  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
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
    @item.images
    @category_parent_array = Category.where(ancestry: nil)
    @item_root_category = @item.category.root
    @item_children_category = @item_root_category.children
    item_parent_category = @item.category.parent
    @item_grandcildren_category = item_parent_category.children
  end

  def update
    if @item.update(item_params)
      redirect_to root_path, notice: "更新しました"
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

  def show
    @item = Item.find(params[:id])
    @image = @item.images.first
    @images = @item.images
    @address = Prefecture.find(@item.prefecture_id)
    @seller = User.find(@item.seller_id)
    # @category = Category.find(@item.category_id)
    @category = @item.category
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

  def move_to_index
    @item = Item.find(params[:id])
    if ! user_signed_in? || current_user.id != @item.seller_id 
      redirect_to action: :index 
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end