class TweetsController < ApplicationController
  before_filter :authenticate_user!, :except => :index

  def index
    @user = User.find_by_user_name(params[:username]) || not_found
    @tweets = @user.tweets
  end

  def new
    @tweet = current_user.tweets.new
  end

  def create
    respond_to do |format|
      if current_user.publish_tweet(params[:tweet])
        flash[:tweet_success] = "Tweet successfully posted"
      else
        flash[:tweet_failure] = "Tweet failed to post"
      end
      format.js
    end
  end

  def show

  end

  def destroy
    current_user.tweets.find(params[:id]).destroy
    flash[:success] = "Tweet deleted"
  rescue
    flash[:failure] = "Delete failed"
  ensure
    redirect_to user_tweets_path(current_user.user_name)
  end
end
