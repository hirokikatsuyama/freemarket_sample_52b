class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :avater_image, :text
    add_column :users, :email, :string
    add_column :users, :password, :string
    add_column :users, :password_confirmation, :string
  end
end
