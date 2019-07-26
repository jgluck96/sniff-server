class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, length: { minimum: 3 }
  has_one :cart
  has_many :orders
  has_secure_password
end
