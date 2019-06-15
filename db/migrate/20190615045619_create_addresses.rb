class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :postal
      t.string :prefecture
      t.string :city
      t.string :address
      t.string :building
      t.integer :phone
      t.references :user

      t.timestamps
    end
  end
end
