class AddBrandsGroupToBrands < ActiveRecord::Migration[5.2]
  def change
    add_reference :brands, :brands_group, foreign_key: true
  end
end