class User < ApplicationRecord
  has_many :carts
  has_many :orders

  has_secure_password

  enum role: { customer: 0, admin: 1 }

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end
