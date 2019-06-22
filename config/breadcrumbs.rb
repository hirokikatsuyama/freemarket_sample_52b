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