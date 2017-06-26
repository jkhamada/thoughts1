class User < ApplicationRecord
  has_secure_password
  has_many :ideas
  has_many :likes
  has_many :liked_ideas, through: :likes, source: :idea

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :alias, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, length: { minimum: 8 }

end
