class User < ApplicationRecord
  validates :name, presence: true
  
  before_validation {email.downcase!}
  validates :email, presence: true, uniqueness: true
  
  has_secure_password
  validates :password, presence: true, length: {minimum: 4}
  
  has_many :blogs, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_blogs, through: :likes, source: :blog
end
