class PostSerializer < ActiveModel::Serializer
  attributes :image_url, :description, :comments

  def comments
    custom_comments = []

    object.comments.each do |comment|
      custom_comment = comment.attributes
      custom_comment[:user_name] = comment.user.name

      custom_comments << custom_comment
    end

    custom_comments
  end
end
