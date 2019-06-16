class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.string :evaluation
      t.integer :date
      t.references :user, foreign_key:true
      t.references :transaction, foreign_key:true

      t.timestamps
    end
  end
end
