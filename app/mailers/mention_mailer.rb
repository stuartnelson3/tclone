class MentionMailer < ActionMailer::Base
  default from: "no-reply@twabbler.com"

  def mention_email(tweet, user_name)
    if @user = User.find_by_user_name(user_name)
      @tweet = tweet
      mail(to: @user.email, subject: "You were mentioned by #{@tweet.owner_name}!")
    end
  end
end
