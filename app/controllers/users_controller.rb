class UsersController < ApplicationController
  def index
    if user_signed_in?
      @users = User.where("users.id <> ?", current_user.id)
      @following_tweets = current_user.following_tweets
    else
      redirect_to new_user_registration_path
    end
  end
end
