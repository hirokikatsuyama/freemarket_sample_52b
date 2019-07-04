class ChangeDatatypeShippingCostOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :shipping_cost, :integer
  end
end
