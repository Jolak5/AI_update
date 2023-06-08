class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  def update_comments_counter
    post.increment!(:commentsCounter)
  end

  scope :update_comment_counter, -> { Post.find(3).update(commentsCounter: Comment.where(post_id: 3).size) }
end
