class PostSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :description, :created_at

  has_many :comments
end
