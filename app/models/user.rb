class User < ApplicationRecord
  has_one :address
  has_many :items
  has_many :likes
  has_many :comments
  has_many :transactions
  has_many :evaluations
  has_one :credit
end
