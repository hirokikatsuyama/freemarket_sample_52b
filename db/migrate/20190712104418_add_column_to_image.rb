class AddColumnToImage < ActiveRecord::Migration[5.2]
  def up
    change_column :images, :image,:string, null: false
  end
  def down
    change_column :images, :image,:string
  end
end
