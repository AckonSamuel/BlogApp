class UsersController < ApplicationController
    def index
        @user = User.All
    end
    
    def show
        @user = User.find(param[:id])
    end
end
