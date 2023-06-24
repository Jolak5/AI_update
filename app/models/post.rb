class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id

  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  attribute :commentsCounter, default: 0
  attribute :likesCounter, default: 0

  def recent_comments
    comments.last(3)
  end

  validates :title, presence: true, length: { maximum: 250 }
  validates :commentsCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  private

  def update_post_counter
    author.update(postsCounter: author.posts.count)
  end
end
