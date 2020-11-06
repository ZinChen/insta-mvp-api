class Post < ApplicationRecord
  validates :image_url, presence: true

  belongs_to :user
  has_many :comments
  has_many :likes, class_name: 'PostLike'

  default_scope{ order(created_at: :desc) }
end
