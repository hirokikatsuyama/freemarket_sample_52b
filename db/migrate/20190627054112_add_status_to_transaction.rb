class AddStatusToTransaction < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :status, :integer
  end
end
