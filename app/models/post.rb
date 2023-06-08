class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :posts
  has_many :comments

  scope :update_posts_counter, -> { User.find(2).update(postsCounter: User.find(2).posts.count) }
  scope :post_recent_comments, -> { Comment.where(post_id: 1).order(created_at: :desc).limit(5) }

  def update_post_counter
    author.increment!(:postsCounter)
  end

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :commentsCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { greater_than_or_equal_to: 0 }
end
