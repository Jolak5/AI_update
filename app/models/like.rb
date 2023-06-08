class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :posts

  def update_likes_counter
    post.increment!(:likesCounter)
  end

  scope :update_post_likes, -> { Post.find(2).update(likesCounter: Like.where(post_id: 2).size) }
end
