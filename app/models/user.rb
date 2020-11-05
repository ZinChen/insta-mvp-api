class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :posts
  has_many :likes
  has_many :comments
end
