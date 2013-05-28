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
    current_user.save
    render nothing: true
  end

  def destroy
    current_user.unfollow(params[:user_id])
    current_user.save
    render nothing: true
  end
end
