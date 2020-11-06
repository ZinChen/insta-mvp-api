class CommentSerializer < ActiveModel::Serializer
  attributes :content, :created_at, :user_name

  def user_name
    object.user.name
  end

  # belongs_to :user
  # belongs_to :post
end
