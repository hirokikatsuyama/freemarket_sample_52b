class ChangeDatatypeMethodCostOfShippingMethods < ActiveRecord::Migration[5.2]
  def change
    change_column :shipping_methods, :method_cost, :integer
  end
end
