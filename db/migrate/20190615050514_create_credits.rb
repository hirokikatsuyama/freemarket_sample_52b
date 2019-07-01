class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.string :card_number
      t.string :expiration_date_month
      t.string :expiration_date_year
      t.string :security_code
      t.string :customer_id
      t.string :card_id

      t.timestamps
    end
  end
end
