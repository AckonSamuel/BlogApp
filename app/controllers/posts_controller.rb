class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @pagy, @posts = pagy(@user.posts.order(created_at: :desc), items: 3)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.new
    render :new, locals: { post: @post }
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_post_path(@user, @post.id)
        else
          flash[:error] = 'Error. Unable to create post'
          render :new, locals: { post: @post }
        end
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    user = User.find(post.user_id)
    user.posts_counter = user.posts_counter - 1
    post.comments.destroy_all
    post.likes.destroy_all
    post.destroy
    post.save
    flash[:success] = 'Post deleted'
    redirect_to user_posts_path(user)
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text, :likes_counter, :comments_counter)
  end
end
