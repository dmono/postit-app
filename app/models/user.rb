class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  has_many :votes

  # want to provide our own validations
  has_secure_password validations: false

  validates :username, presence: true, uniqueness: true
  # only require a password when creating a user, not when editing the user
  validates :password, presence: true, on: :create, length: {minimum: 5}
end