class FollowerConnectionsControllerController < ApplicationController
  before_filter :authenticate_user!
  def create
    @following = current_user.followers.build(follower_id: params[:follower_id])
    if @following.save
      flash[:success] = "Followed #{params[:username]}!"
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
