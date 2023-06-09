class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :posts

  after_save :update_likes_counter

  def update_likes_counter
    posts.increment!(:likesCounter)
  end
end
