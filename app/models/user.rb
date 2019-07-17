class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, presence: true
  validates :password, length: { minimum: 3 }
  has_many :soaps

  has_secure_password
end
