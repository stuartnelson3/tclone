class FollowerConnectionsController < ApplicationController
  before_filter :authenticate_user!
  def create
    user_to_follow = User.find_by_id(params[:user_id])
    current_user.following << user_to_follow
    if current_user.save
      flash[:success] = "Followed #{user_to_follow.user_name}!"
    else
      flash[:error] = "Error occurred! Follow again later."
    end
    redirect_to root_path
  end

  def destroy
    current_user.unfollow_user(params[:user])
    flash[:success] = "No longer following #{params[:username]}!"
    redirect_to root_path
  end
end
