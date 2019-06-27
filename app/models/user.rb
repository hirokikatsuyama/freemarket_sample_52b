class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :nickname,
             presence: true
  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    
  has_secure_password validations: false
  validate(on: [:update, :validate_password]) do |record|
    record.errors.add(:password, :blank) unless record.password_digest.present?
  end
  validates_length_of :password, maximum: ActiveModel::SecurePassword::MAX_PASSWORD_LENGTH_ALLOWED, on: [:update, :validate_password]
  validates_confirmation_of :password, allow_blank: true, on: [:update, :validate_password]
  

  has_one :address
  has_one :profile
  accepts_nested_attributes_for :profile
  has_many :items
  has_many :likes
  has_many :comments
  has_many :transactions
  has_many :evaluations
  has_one :credit
  has_many :sns_credentials, dependent: :destroy
  accepts_nested_attributes_for :sns_credentials
  
end
