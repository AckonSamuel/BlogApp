class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @post = Post.where(user_id: params[@user.id])
  end

  def show
    @posts
  end
end
