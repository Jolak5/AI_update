class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :posts
  has_many :comments

  scope :update_post_counter, -> { User.find(2).update(posts_counter: User.find(2).posts.count) }
  scope :post_recent_comments, -> { Comment.where(post_id: 2).order(created_at: :desc).first(5) }
end
