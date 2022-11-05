module API
    class Base < Grape::API
        http_basic do |email, password|
            user = User.find_by_email(email)
            user && user.valid_password?(password)
          end
        before do
      error!("401 Unauthorized", 401) unless authenticated
    end
 
    helpers do
      def authenticated
        user = User.find_by_email(params[:email])
        user && user.valid_password?(params[:password])
      end
    end
      mount API::V1::Base
    end
  end