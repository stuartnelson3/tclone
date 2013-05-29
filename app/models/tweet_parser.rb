class TweetParser
  attr_reader :tweet, :text
  def initialize(tweet)
    @tweet = tweet
    @text = tweet.text
  end

  def parse
    substitute_mentions_for_links
    send_mention_emails
    text
  end

  def send_mention_emails
    parsed_user_names.each do |user_name|
      MentionMailer.mention_email(tweet, user_name[1..-1])
    end
  end

  def substitute_mentions_for_links
    parsed_user_names.each do |user_name|
      text.gsub!(user_name, make_link(user_name))
    end
  end

  def make_link(user_name)
    "<a href='/#{user_name[1..-1]}' class='mention-link'>#{user_name}</a>"
  end

  def parsed_user_names
    @parsed_user_names ||= text.scan(/@{1}[a-zA-Z1-9_]+/i).flatten
  end
end
