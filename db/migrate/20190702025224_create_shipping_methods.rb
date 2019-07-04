class CreateShippingMethods < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_methods do |t|
      t.string :method_name
      t.string :method_cost

      t.timestamps
    end
  end
end
