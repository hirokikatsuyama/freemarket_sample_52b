class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.references :item
      t.references :buyer
      t.references :seller

      t.timestamps
    end
  end
end
