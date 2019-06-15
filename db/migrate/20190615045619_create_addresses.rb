class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal
      t.string :prefecture
      t.string :city
      t.string :address
      t.string :building
      t.integer :phone
      t.references :user_id, foreign_key:true

      t.timestamps
    end
  end
end
