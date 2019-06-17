class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def show
    @item = Item.find(1)
    # @user = @item.
  end
end
