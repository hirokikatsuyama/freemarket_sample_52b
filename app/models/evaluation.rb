class Evaluation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :tansaction, optional: true

  scope :evaluation, -> (count, user) { where(evaluation: count, user_id: user) }
  
end
