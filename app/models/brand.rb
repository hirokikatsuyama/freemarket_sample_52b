class Brand < ApplicationRecord
  belongs_to :brands_group, optional: true
  has_many :items
end
