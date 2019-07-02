class ItemsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :destroy,]
  include AjaxHelper 

  def index
    @lady_items = Item.includes(:images).where(category_id: Category.find(1).subtree_ids).where(status: 1).order(created_at: "DESC").limit(4)
    @man_items = Item.includes(:images).where(category_id: Category.find(2).subtree_ids).where(status: 1).order(created_at: "DESC").limit(4)
    @kids_items = Item.includes(:images).where(category_id: Category.find(3).subtree_ids).where(status: 1).order(created_at: "DESC").limit(4)
    @beauty_items = Item.includes(:images).where(category_id: Category.find(7).subtree_ids).where(status: 1).order(created_at: "DESC").limit(4)
    @chanel = Item.includes(:images).where(brand_id: 1).where(status: 1).order(created_at: "DESC").limit(4)
    @vuitton = Item.includes(:images).where(brand_id: 2).where(status: 1).order(created_at: "DESC").limit(4)
    @supreme = Item.includes(:images).where(brand_id: 3).where(status: 1).order(created_at: "DESC").limit(4)
    @nike = Item.includes(:images).where(brand_id: 4).where(status: 1).order(created_at: "DESC").limit(4)
  end

  def set_search
    @search = Item.ransack(params[:q])
    @products = @search.result
  end

  def new
    @item = Item.new
    @item.images.build
    @parents = Category.order("id ASC").limit(13)
    @sizes = Size.all
  end

  def create
    respond_to do |format|
      if brand = Brand.find_by(name: params[:item][:brand_id])
        params[:item][:brand_id] = brand.id
      else
        params[:item][:brand_id] = Brand.create(name: params[:item][:brand_id]).id
      end

      @item = Item.new(item_params)
      @item.status = 1
      if @item.save && new_image_params[:images][0] != ""
        new_image_params[:images].map do |image|
          @item.images.create(image: image, item_id: @item.id)
        end
        Transaction.create(seller_id: @item.user_id, item_id: @item.id, status: 1)
        format.js{render ajax_redirect_to(root_path)}
      else
        format.js{render ajax_redirect_to(new_item_path)}
      end
    end
  end

  def edit
    @parents = Category.order("id ASC").limit(13)
    @sizes = Size.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
       @item.update!(item_params)
       redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @item = Item.find(params[:id])
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
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def keyword_search
    @search_items = Item.all
  end

  private

    def item_params
      params.require(:item).permit(:name, :detail, :condition, :shipping_cost, :delivery_date, :shipping_source, :price, :brand_id, :size_id, :category_id).merge(user_id: current_user.id)
    end
    def new_image_params
      params.require(:new_images).permit({images:[]})
    end
    def set_item
      @item = Item.find(params[:id])
    end
  end

