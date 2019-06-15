class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :text
      t.references :user_id, foreign_key:true
      t.references :item_id, foreign_key:true

      t.timestamps
    end
  end
end
