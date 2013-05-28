class TweetParser
  attr_reader :tweet, :text
  def initialize(tweet)
    @tweet = tweet
    @text = tweet.text
  end

  def parse
    parse_user_names.each do |user_name|
      text.gsub!(user_name, make_link(user_name))
    end
    parse_user_names.each do |user_name|
      MentionMailer.mention_email(tweet, user_name[1..-1]).deliver
    end
    text
  end

  def make_link(user_name)
    base_url = Rails.env.production? ? "heroku.url.here" : "localhost:3000"
    "<a href='#{base_url}/#{user_name[1..-1]}' class='mention-link'>#{user_name}</a>"
  end

  def parse_user_names
    text.scan(/@{1}[a-zA-Z1-9_]+/i).flatten
  end
end
