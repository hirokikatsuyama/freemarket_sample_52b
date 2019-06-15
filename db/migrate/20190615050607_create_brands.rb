class CreateBrands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :name
      t.references :brands_group_id, foreign_key:true

      t.timestamps
    end
  end
end
