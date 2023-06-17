class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy, foreign_key: :author_id
  has_many :likes, dependent: :destroy, foreign_key: :author_id

  validates :name, presence: true
  validates :postsCounter, numericality: { greater_than_or_equal_to: 0 }

  attribute :postsCounter, default: 0

  def recent_post
    posts.order(created_at: :DESC).limit(3)
  end

  def user_has_liked(post_id)
    likes.exists?(post_id:)
  end

  def remove_user_like(post_id)
    likes.find_by(post_id:).destroy
  end

  def add_user_like(post_id)
    likes.create(post_id:)
  end
end
