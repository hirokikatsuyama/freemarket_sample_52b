class User < ApplicationRecord
  has_one :address
  has_many :items
  has_many :likes
  has_many :comments
  has_many :transactions
  has_many :evaluations
  has_one :credit
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
