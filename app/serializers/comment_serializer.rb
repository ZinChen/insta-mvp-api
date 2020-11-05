class CommentSerializer < ActiveModel::Serializer
  attributes :content

  belongs_to :user
  belongs_to :post
end
