module API
    module V1
      class Comments < Grape::API
        include API::V1::Defaults
            resource :comments
             desc "Return all comments"
          params do
            requires :user_id, type: String, desc: "ID of the user"
            requires :post_id, type: String, desc: "ID of the post"
          end
          get "/users/:user_id/posts/:post_id/comments" do
            # User.where(id: permitted_params[:user_id]).posts.all
            User.find(params[:user_id]).posts.find(params[:post_id]).comments
          end
        desc "Return a comment"
          params do
            requires :user_id, type: String, desc: "ID of the user"
            requires :post_id, type: String, desc: "ID of the post"
            requires :id, type: String, desc: "ID of the comment"
          end
          get "/users/:user_id/posts/:post_id/comments/:id" do
            User.find(params[:user_id]).posts.find(params[:post_id]).comments.find(params[:id])
            # User.where(id: permitted_params[:id]).first!
          end

          desc "Add a comment"
          params do
            requires :user_id, type: String, desc: "ID of the user"
            requires :post_id, type: String, desc: "ID of the post"
            requires :text, type: String
          end
          post "/users/:user_id/posts/:post_id/comments" do

            User.find(params[:user_id]).posts.find(params[:post_id]).comments.create(
                {
                user: User.find(params[:user_id]), 
                post: User.find(params[:user_id]).posts.find(params[:post_id]), 
                text:params[:text]
            }).save!
            # User.find(10).posts.find(5).comments.create({user: User.find(10), post: User.find(10).posts.find(5), text: 'okay'}).save!
            # User.where(id: permitted_params[:id]).first!
          end
      end
    end
  end