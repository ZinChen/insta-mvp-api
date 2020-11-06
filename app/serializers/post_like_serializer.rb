class PostLikeSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :user_name, :user_photo

  def user_name
    object.user.name
  end

  def user_photo
    object.user.photo
  end
end
