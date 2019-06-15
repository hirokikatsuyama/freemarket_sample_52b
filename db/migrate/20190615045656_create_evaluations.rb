class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.string :evaluation
      t.integer :date
      t.references :user_id, foreign_key:true
      t.references :transaction_id, foreign_key:true

      t.timestamps
    end
  end
end
