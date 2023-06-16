class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post
  validates :likesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  after_save :update_likes_counter

  private

  def update_likes_counter
    post.update(likesCounter: post.likes.count)
  end
end
