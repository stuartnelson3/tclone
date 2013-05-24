class UsersController < ApplicationController
  def index
    if user_signed_in?
      @users = User.where("users.id <> ?", current_user.id)
      @following_tweets = current_user.following_tweets
      @tweet = current_user.tweets.new
    else
      redirect_to new_user_registration_path
    end
  end

  def show
    # show info about the user, like their profile page
  end
end
