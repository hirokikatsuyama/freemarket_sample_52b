class AddColumnToCredits < ActiveRecord::Migration[5.2]
  def change
    add_column :credits, :customer_id, :integer
    add_column :credits, :card_id, :integer
  end
end
