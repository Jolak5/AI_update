class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(title: post_params[:title], text: post_params[:text], author_id: current_user[:id],
                     commentsCounter: 0, likesCounter: 0)

    if @post.save
      redirect_to user_post_path(current_user, @post), notice: 'Post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
