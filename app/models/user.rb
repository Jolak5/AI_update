class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, dependent: :destroy, foreign_key: :author_id
  has_many :likes, dependent: :destroy, foreign_key: :author_id

  scope :user_recent_posts, -> { find(1).posts.order(created_at: :desc).first(3) }
end
