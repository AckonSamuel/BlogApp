class ConmmentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.post = post
    if comment.save
      flash[:success] = 'Comment created successfully'
    else
      flash[:error] = 'Comment not created'
    end
    redirect_to user_post_path(current_user, post)
  end

  def new
  end

  def comment_params
  end
end
