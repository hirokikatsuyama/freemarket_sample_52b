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

  def new
    unless current_user
      redirect_to sign_in_users_path
      flash[:notice] = "ログインが必要です。アカウントをお持ちでない場合は上記の「新規会員登録」より会員登録をしてください。"
    else
      @item = Item.new
      10.times { @item.images.build }
      @parents = Category.order("id ASC").limit(13)
      @sizes = Size.all
    end
  end

  def create
    if brand = Brand.find_by(name: params[:item][:brand_id])
      params[:item][:brand_id] = brand.id
    else
      params[:item][:brand_id] = Brand.create(name: params[:item][:brand_id]).id
    end
      @item = Item.new(item_params)
      @item.status = 1
    if @item.save
      Transaction.create(seller_id: @item.user_id, item_id: @item.id, status: 1)
      redirect_to root_path
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
    unless current_user
      redirect_to sign_in_users_path
      flash[:notice] = "ログインが必要です。アカウントをお持ちでない場合は上記の「新規会員登録」より会員登録をしてください。"
    else
      @item = Item.find(params[:id])
      @user = @item.user
      @images = @item.images
      @category = @item.category
      @brand = @item.brand
      @good = Evaluation.evaluation(1, @user)
      @normal = Evaluation.evaluation(2, @user)
      @bad = Evaluation.evaluation(3, @user)
      @prefecture = Prefecture.find(@item[:shipping_source]).name
      @ShippingMethod = ShippingMethod.find(@item[:shipping_cost]).method_name
      if @item.shipping_cost == 2
        @ShippngCost = "送料込み（出品者負担）"
      elsif @item.shipping_cost == 3
        @ShippngCost = "着払い（購入者負担）"
      end
    end
  end

  def search
    @children = Category.find(params[:parent_id]).children
    @sizing = Category.find(params[:parent_id]).size
    @size = Size.where(sizing:@sizing)
    respond_to do |format|
      format.html  { redirect_to :root }
      format.json  { render json: { categories: @children, sizes: @size} }
      #カテゴリーテーブルとサイズテーブル、異なる2つのテーブルから値を取得
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

  def shipping_search
    @shipping_cost = params[:shipping_id]
    @shipping = ShippingMethod.where(method_cost:@shipping_cost)
    respond_to do |format|
      format.html 
      format.json
    end
  end


  private

    def item_params
      params.require(:item).permit(:name, :detail, :condition, :shipping_method_id, :shipping_cost, :delivery_date, :shipping_source, :price, :brand_id, :size_id, :category_id, images_attributes: [:image]).merge(user_id: current_user.id)
    end

    def set_item
      @item = Item.find(params[:id])
    end
  end

