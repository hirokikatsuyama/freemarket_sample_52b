class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.string :evaluation
      t.integer :date
      t.references :user
      t.references :transaction

      t.timestamps
    end
  end
end
