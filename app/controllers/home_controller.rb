class HomeController < ApplicationController
  def index
    @user = User.new
    @user_name = :user
  end
end
