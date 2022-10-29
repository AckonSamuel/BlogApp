class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.where(user_id: params[@user.id])
  end

  def show
    @post
    @user
  end

  def new
    @user
    @post = @user.posts.new
    render :new, locals: { post: @post }
  end

  def create
    @user
    @post = @user.posts.new(post_params)
    @post.comments_counter = 0
    @post.likes_counter = 0
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_post_path(@user)
        else
          flash[:error] = 'Error. Unable to create post'
          render :new, locals: { post: @post }
        end
      end
  end
end
