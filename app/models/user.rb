class User < ActiveRecord::Base
  has_secure_password
  has_many :brands

  validates :email, presence: true
  validates :email, uniqueness : { message: "%{value} is already spoken for. Please try again with a different email."}
end
