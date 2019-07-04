class ChangeDatatypeShippingMethodOfItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :shipping_method, foreign_key: true
  end
end
