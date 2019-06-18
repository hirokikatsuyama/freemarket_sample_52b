class Item < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :brand, optional: true
  belongs_to :size, optional: true
  belongs_to :category, optional: true
  has_many :likes
  has_many :comments
  has_many :images
  has_many :transactions
end
