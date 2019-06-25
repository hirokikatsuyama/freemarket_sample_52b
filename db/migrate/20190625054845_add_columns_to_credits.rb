class AddColumnsToCredits < ActiveRecord::Migration[5.2]
  def change
    add_column :credits, :card_number, :integer
    add_column :credits, :expiration_date_month, :integer
    add_column :credits, :expiration_date_year, :integer
    add_column :credits, :security_code, :integer
  end
end
