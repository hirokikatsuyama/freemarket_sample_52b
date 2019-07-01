class RemoveImageFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :image, :string
    remove_column :items, :images, :string
  end
end
