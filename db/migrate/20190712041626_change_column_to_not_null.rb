class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :name,:string, null: false
    change_column :items, :detail,:text, null: false
    change_column :items, :condition,:string, null: false
    change_column :items, :shipping_source,:string, null: false
    change_column :items, :delivery_date,:string, null: false
  end

  def down
    change_column :users, :name,:string
    change_column :items, :detail,:text
    change_column :items, :condition,:string
    change_column :items, :shipping_source,:string
    change_column :items, :delivery_date,:string

  end
end
