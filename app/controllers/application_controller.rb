class ApplicationController < ActionController::Base
  def current_user
    User.fist
  end
end
