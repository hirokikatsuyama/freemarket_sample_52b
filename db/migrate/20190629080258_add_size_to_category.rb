class AddSizeToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :size, :integer
  end
end
