class ItemsController < ApplicationController
  def index
    @lady_items = Item.where(category_id: Category.find(1).subtree_ids).order(created_at: "DESC").limit(4)
    @man_items = Item.where(category_id: Category.find(200).subtree_ids).order(created_at: "DESC").limit(4)
    @kids_items = Item.where(category_id: Category.find(345).subtree_ids).order(created_at: "DESC").limit(4)
    @beauty_items = Item.where(category_id: Category.find(793).subtree_ids).order(created_at: "DESC").limit(4)
  end

  def new
  end

  def show
    @item = Item.find(1)
    # @user = @item.
  end
end
