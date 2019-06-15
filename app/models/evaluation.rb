class Evaluation < ApplicationRecord
  belongs_to :user_id
  belongs_to :transaction_id
  belongs_to :user
  belongs_to :tansaction
end
