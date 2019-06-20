class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :nickname,
             presence: true
  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }

  has_secure_password

  has_one :address
  has_one :profile
  accepts_nested_attributes_for :profile
  has_many :items
  has_many :likes
  has_many :comments
  has_many :transactions
  has_many :evaluations
  has_one :credit

  FactoryBot.define do

    factory :user do
      nickname              {"abe"}
      email                 {"kkk@gmail.com"}
      password              {"00000000"}
      password_confirmation {"00000000"}
    end
  end
end
