class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy, foreign_key: :author_id
  has_many :likes, dependent: :destroy, foreign_key: :author_id

  validates :name, presence: true
  validates :postsCounter, numericality: { greater_than_or_equal_to: 0 }

  def recent_post
    posts.order('created_at Desc').limit(3)
  end
end
