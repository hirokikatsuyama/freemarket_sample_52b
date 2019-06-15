class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :family_name
      t.string :first_name_kana
      t.string :family_name_kana
      t.text :introduction
      t.integer :birthday_year
      t.integer :birthday_month
      t.integer :bithday_day
      t.references :user

      t.timestamps
    end
  end
end
