class PostSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :description, :created_at, :user_name, :user_photo, :likes_count, :comments_count

  has_many :comments
  has_many :likes

  def user_name
    object.user.name
  end

  def user_photo
    object.user.photo
  end

  def likes_count
    object.likes.count
  end

  def comments_count
    object.comments.count
  end
end
