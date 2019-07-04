crumb :root do
  link "メルカリ", root_path
end

crumb :category_index do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :category do |category|
  link category.name, category_path(category.id)

  if category.parent.present?
    parent category.parent
  end
end

crumb :user_show do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :listing_transactions do
  link "出品した商品 - 出品中", listing_transactions_path
  parent :user_show
end

crumb :progress_transactions do
  link "出品した商品 - 取引中", in_progress_transactions_path
  parent :user_show
end

crumb :completed_transactions do
  link "出品した商品 - 売却済み", completed_transactions_path
  parent :user_show
end

crumb :new_credit do
  link "支払い方法", new_credit_path
  parent :user_show
end

crumb :log_out_page_users do
  link "ログアウト", log_out_page_users_path
  parent :user_show
end

crumb :item do
  @item = Item.find(params[:id])
  link @item.name, item_path
  parent :root
end