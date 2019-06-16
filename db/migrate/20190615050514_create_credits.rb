class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.string :card_number
      t.string :expiration_date_month
      t.string :expiration_date_year
      t.string :security_code
      # t.references :user, foreign_key:true

      t.timestamps
    end
  end
end
