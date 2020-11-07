class Comment < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :post

  default_scope{ order(created_at: :asc) }
end
