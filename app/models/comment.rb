class Comment < ApplicationRecord
  belongs_to :user_id
  belongs_to :item_id
  belongs_to :user
  belongs_to :item
end
