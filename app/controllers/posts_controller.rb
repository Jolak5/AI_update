class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).where(author_id: params[:user_id])
    @user = User..includes(:posts, :comments).find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:error] = 'Post not found'
    redirect_to user_posts_path(@user)
  end
  
  
  def new
    @post = current_user.posts.new

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

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    authorize! :destroy, @post
    @post.destroy
    redirect_to user_path(@user)
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
