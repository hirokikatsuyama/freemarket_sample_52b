class ItemsController < ApplicationController
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
    @parents = Category.all.order("id ASC").limit(13)
    @address = Address.new
  end

  def create
    Item.create!(item_params)
    redirect_to controller: :items, action: :index
  end





  def show
  end


  def search
    @children = Category.find(params[:parent_id]).children
    respond_to do |format|
      format.html
      format.json
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :detail, :condition, :shipping_cost, :delivery_date, :price)
  end
end
