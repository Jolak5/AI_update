class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :posts
  has_many :comments


  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :commentsCounter, numericality: { greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: { greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:postsCounter)
  end
end
