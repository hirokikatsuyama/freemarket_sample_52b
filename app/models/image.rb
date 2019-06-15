class Image < ApplicationRecord
  belongs_to :item_id
  belongs_to :item
end
