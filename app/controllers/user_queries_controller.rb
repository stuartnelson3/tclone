class UserQueriesController < ApplicationController
  def index
    @users = UserQuery.new(params[:user_name]).search
    if @users.count == 1
      redirect_to user_tweets_path @users.first.user_name
    end
  end
end
