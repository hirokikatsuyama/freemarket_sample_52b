class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :destroy]

  def index
    @lady_items = Item.includes(:images).where(category_id: Category.find(1).subtree_ids).order(created_at: "DESC").limit(4)
    @man_items = Item.includes(:images).where(category_id: Category.find(2).subtree_ids).order(created_at: "DESC").limit(4)
    @kids_items = Item.includes(:images).where(category_id: Category.find(3).subtree_ids).order(created_at: "DESC").limit(4)
    @beauty_items = Item.includes(:images).where(category_id: Category.find(7).subtree_ids).order(created_at: "DESC").limit(4)
    @chanel = Item.includes(:images).where(brand_id: 1).order(created_at: "DESC").limit(4)
    @vuitton = Item.includes(:images).where(brand_id: 2).order(created_at: "DESC").limit(4)
    @supreme = Item.includes(:images).where(brand_id: 3).order(created_at: "DESC").limit(4)
    @nike = Item.includes(:images).where(brand_id: 4).order(created_at: "DESC").limit(4)
  end

  def new
    @item = Item.new
    @parents = Category.order("id ASC").limit(13)
    @sizes = Size.all
  end

  def create
    if brand = Brand.find_by(name: params[:item][:brand_id])
      params[:item][:brand_id] = brand.id
    else
      params[:item][:brand_id] = Brand.create(name: params[:item][:brand_id]).id
    end
    Item.create!(item_params)
    redirect_to controller: :items, action: :index
  end

  def show
    @user = @item.user
    @image = @item.images
    @category = @item.category
    @brand = @item.brand
    @good = Evaluation.evaluation(1, @user)
    @normal = Evaluation.evaluation(2, @user)
    @bad = Evaluation.evaluation(3, @user)
  end

  def search
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end

  def destroy
    if @item.destroy == current_user == user_id
      redirect_to root_path
    else
      redirect_to root_path alert: "エラーが発生しました。"
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :condition, :shipping_cost, :delivery_date, :shipping_source, :price,{images: []}, :brand_id, :size_id, :category_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
