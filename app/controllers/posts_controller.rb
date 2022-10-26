class PostsController < ApplicationController
    def index
        @user = User.find(param[:user_id])
        @post = Post.where(user_id: param[@user.id])
    end

    def show
        @posts = Post.find(param[:id])
    end
end
