class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  has_many :posts
  has_many :likes, class_name: 'PostLike'
  has_many :comments

  def self.create_photo
    Faker::LoremFlickr.image(
      size: '240x240',
      search_terms: ['people', 'face']
    ) + "?lock=#{rand(1..300)}"
  end
end
