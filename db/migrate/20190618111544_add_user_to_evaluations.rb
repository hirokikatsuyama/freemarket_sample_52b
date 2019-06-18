class AddUserToEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_reference :evaluations, :user, foreign_key: true
    add_reference :evaluations, :transaction, foreign_key: true
  end
end
