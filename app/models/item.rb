class Item < ApplicationRecord
  belongs_to :user_id
  belongs_to :brand_id
  belongs_to :small_category_id
  belongs_to :size_id
  belongs_to :user
  belongs_to :brand
  belongs_to :small_category
  belongs_to :size
  has_many :likes
  has_many :comments
  has_many :images
  has_many :transactions
end
