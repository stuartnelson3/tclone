class FollowerConnectionsController < ApplicationController
  before_filter :authenticate_user!, :except => :index
  def following
    @user = User.find_by_user_name(params[:username]) || not_found
    @following_connections = @user.following
    render "connections"
  end

  def followers
    @user = User.find_by_user_name(params[:username])
    @following_connections = @user.followers
    render "connections"
  end

  def create
    current_user.follow(params[:user_id])
    if current_user.save
      flash[:success] = "Success"
    else
      flash[:error] = "Error occurred! Follow again later."
    end
    redirect_to root_path
  end

  def destroy
    current_user.unfollow(params[:user_id])
    flash[:success] = "Successfully unfollowed"
    redirect_to root_path
  end
end
