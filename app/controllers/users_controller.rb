class UsersController < ApplicationController
  def index
    if user_signed_in?
      @tweets = current_user.tweets
      @users = User.where("users.id <> ?", current_user.id)
    else
      redirect_to new_user_registration_path
    end
  end

  def show
    # show info about the user, like their profile page
  end
end
