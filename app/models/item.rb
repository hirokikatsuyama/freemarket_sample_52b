class Item < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :small_category
  belongs_to :size
  has_many :likes
  has_many :comments
  has_many :images
  has_many :transactions
end
