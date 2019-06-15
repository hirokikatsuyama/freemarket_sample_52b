class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :detail
      t.string :condition
      t.string :shipping_cost
      t.string :shipping_method
      t.string :shipping_source
      t.string :delivery_date
      t.string :shopping_status
      t.integer :price
      t.integer :tax
      t.integer :profit
      t.integer :status
      t.references :user
      t.references :brand
      t.references :small_category
      t.references :size

      t.timestamps
    end
  end
end
