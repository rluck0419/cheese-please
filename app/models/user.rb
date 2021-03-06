class User < ApplicationRecord
  has_secure_password
  has_many :user_cheeses, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
