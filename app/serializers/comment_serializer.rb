class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at,
             :user_name, :user_photo, :user_id

  def user_name
    object.user.name
  end

  def user_photo
    object.user.photo
  end

  def user_id
    object.user.id
  end
end
