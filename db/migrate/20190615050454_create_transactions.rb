class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :item_id, foreign_key:true
      t.references :buyer_id, foreign_key:true
      t.references :seller_id, foreign_key:true

      t.timestamps
    end
  end
end
