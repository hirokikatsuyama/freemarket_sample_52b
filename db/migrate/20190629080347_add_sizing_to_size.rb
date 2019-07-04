class AddSizingToSize < ActiveRecord::Migration[5.2]
  def change
    add_column :sizes, :sizing, :integer
  end
end
