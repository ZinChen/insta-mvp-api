class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :photo, :created_at, :authentication_token, :post_likes

  def post_likes
    object.likes.pluck(:post_id)
  end
end
