class Item < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :size
  belongs_to :category
  has_many :likes
  has_many :comments
  has_many :images
  has_many :transactions
end
