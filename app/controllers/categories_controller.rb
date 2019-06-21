class CategoriesController < ApplicationController

  def index
    @parents = Category.all.order("id ASC").limit(13)
  end

  def show
    @category = Category.find(params[:id])
    @items = Item.includes(:images).where(category_id: Category.find(@category.id).subtree_ids).order(created_at: "DESC")
  end

end
