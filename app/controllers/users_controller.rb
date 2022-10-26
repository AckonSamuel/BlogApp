class UsersController < ApplicationController
    def index
        @user = User.All
    end
    
    def display
        @user = User.find(param[:id])
    end
end