class ItemsController < ApplicationController
  before_action :category_parent_array, only: [:new, :create, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :show_all_instance, only: [:show, :edit, :destroy]


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
    @category_children = Category.find("#{params[:parent_id]}").children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
    grandchild = @item.category
    child = grandchild.parent
    if @category_id == 46 or @category_id == 74 or @category_id == 134 or @category_id == 142 or @category_id == 147 or @category_id == 150 or @category_id == 158
    else
     @parent_array = []
     @parent_array << @item.category.parent.parent.name
     @parent_array << @item.category.parent.parent.id
    end
     @category_children_array = Category.where(ancestry: child.ancestry)
     @child_array = []
     @child_array << child.name
     @child_array << child.id

     @category_grandchildren_array = Category.where(ancestry: grandchild.ancestry)
     @grandchild_array = []
     @grandchild_array << grandchild.name
     @grandchild_array << grandchild.id

  end


  def update
    if item_params[:images_attributes].nil?
      flash.now[:alert] = '更新できませんでした 【画像を１枚以上入れてください】'
      render :edit
    else
      exit_ids = []
      item_params[:images_attributes].each do |a,b|
        exit_ids << item_params[:images_attributes].dig(:"#{a}",:id).to_i
      end
      ids = Image.where(item_id: params[:id]).map{|image| image.id }
      delete__db = ids - exit_ids
      Image.where(id:delete__db).destroy_all
      @item.touch
      if @item.update(item_params)
        redirect_to  root_path, notice: "更新しました"
      else
        flash.now[:alert] = '更新できませんでした'
        render :edit
      end
    end
  end


  def update_done
    @item_update = Item.order("updated_at DESC").first
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
    @brand = Brand.find(@item.brand_id)
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
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

  def category_parent_array
    @category_parent_array = Category.where(ancestry: nil).each do |parent|
    end
  end

  def show_all_instance
    @user = User.find(@item.seller_id)
    @images = Image.where(item_id: params[:id])
    @images_first = Image.where(item_id: params[:id]).first
    @category_id = @item.category_id
    @category_parent = Category.find(@category_id).parent.parent
    @category_child = Category.find(@category_id).parent
    @category_grandchild = Category.find(@category_id)
  end

end