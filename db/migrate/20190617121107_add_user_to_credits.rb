class AddUserToCredits < ActiveRecord::Migration[5.2]
  def change
    add_reference :credits, :user, foreign_key: true
  end
end