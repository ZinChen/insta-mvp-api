class PostLike < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :by_post, ->(post_id) { where(post_id: post_id) }
end
