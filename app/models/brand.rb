class Brand < ApplicationRecord
  belongs_to :brands_group_id
  belongs_to :brands_group
  has_many :items
end
