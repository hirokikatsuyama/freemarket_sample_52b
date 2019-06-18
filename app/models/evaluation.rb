class Evaluation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :tansaction, optional: true
end
