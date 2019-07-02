class RemoveColumnFromCredits < ActiveRecord::Migration[5.2]
  def change
    remove_column :credits, :card_number, :string
    remove_column :credits, :expiration_date_month, :string
    remove_column :credits, :expiration_date_year, :string
    remove_column :credits, :security_code, :string
  end
end
