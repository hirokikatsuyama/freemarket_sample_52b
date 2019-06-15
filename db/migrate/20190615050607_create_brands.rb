class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.references :brands_group

      t.timestamps
    end
  end
end
