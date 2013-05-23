class UsersController < ApplicationController
  def index
    if user_signed_in?
      @tweets = current_user.tweets
    else
      redirect_to new_user_registration_path
    end
  end

  def show
    @tweets = current_user.tweets
  end
end
