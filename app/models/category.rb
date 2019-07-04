class Category < ApplicationRecord
  has_many :items
  has_ancestry
  belongs_to :sizes
end
