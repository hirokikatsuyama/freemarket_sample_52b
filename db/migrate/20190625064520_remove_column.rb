class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :credits, :card_number, :integer
    remove_column :credits, :expiration_date_month, :integer
    remove_column :credits, :expiration_date_year, :integer
    remove_column :credits, :security_code, :integer
    remove_column :credits, :customer_id, :integer
    remove_column :credits, :card_id, :integer
  end
end
