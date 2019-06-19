class ItemsController < ApplicationController
  def index
    @lady_items = Item.includes(:images).where(category_id: Category.find(1).subtree_ids).order(created_at: "DESC").limit(4)
    @man_items = Item.includes(:images).where(category_id: Category.find(200).subtree_ids).order(created_at: "DESC").limit(4)
    @kids_items = Item.includes(:images).where(category_id: Category.find(345).subtree_ids).order(created_at: "DESC").limit(4)
    @beauty_items = Item.includes(:images).where(category_id: Category.find(793).subtree_ids).order(created_at: "DESC").limit(4)
    @chanel = Item.includes(:images).where(brand_id: 1).order(created_at: "DESC").limit(4)
    @vuitton = Item.includes(:images).where(brand_id: 3).order(created_at: "DESC").limit(4)
    @supreme = Item.includes(:images).where(brand_id: 4).order(created_at: "DESC").limit(4)
    @nike = Item.includes(:images).where(brand_id: 2).order(created_at: "DESC").limit(4)
  end

  def new
  end

  def show
    @item = Item.find(1)
    # @user = @item.
  end
end
