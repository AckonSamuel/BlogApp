module API
    module V1
      class Posts < Grape::API
        include API::V1::Defaults
            resource :posts
             desc "Return all posts"
          params do
            requires :user_id, type: String, desc: "ID of the user"
          end
          get "/users/:user_id/posts" do
            # User.where(id: permitted_params[:user_id]).posts.all
            User.find(params[:user_id]).posts
          end
        desc "Return a post"
          params do
            requires :user_id, type: String, desc: "ID of the user"
            requires :id, type: String, desc: "ID of the post"
          end
          get "/users/:user_id/posts/:id" do
            User.where(id: permitted_params[:user_id]).posts.where(id: permitterd_params[:id])
            # User.where(id: permitted_params[:id]).first!
          end
      end
    end
  end