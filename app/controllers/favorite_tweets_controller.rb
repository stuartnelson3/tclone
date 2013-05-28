class FavoriteTweetsController < ApplicationController
  before_filter :authenticate_user!
  def create
    current_user.favorite_tweet(params[:tweet_id])
    current_user.save
    render nothing: true
  end

  def destroy
    current_user.unfavorite(params[:tweet_id])
    current_user.save
    render nothing: true
  end
end
