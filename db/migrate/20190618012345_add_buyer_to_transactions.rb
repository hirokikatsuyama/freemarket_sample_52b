class AddBuyerToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_reference :transactions, :buyer, foreign_key: { to_table: :users }
    add_reference :transactions, :seller, foreign_key: { to_table: :users }
    add_reference :transactions, :item, foreign_key: true
  end
end