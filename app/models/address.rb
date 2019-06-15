class Address < ApplicationRecord
  belongs_to :user_id
  belongs_to :user
end
