class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    like = Like.new
    like.user = current_user
    like.post = post
    if like.save
      flash[:success] = 'Liked successfully'
    else
      flash[:error] = 'Unable to like post'
    end
    redirect_to user_post_path(current_user, post)
  end
end
