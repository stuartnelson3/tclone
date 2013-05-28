class TweetParser
  attr_reader :text
  def initialize(text)
    @text = text
  end

  def parse
    parse_user_names.each do |user_name|
      text.gsub!(user_name, make_link(user_name))
    end
    text
  end

  def make_link(user_name)
    "<a href='/#{user_name[1..-1]}' class='mention-link'>#{user_name}</a>"
  end

  def parse_user_names
    text.scan(/@{1}[a-zA-Z_]+/i).flatten
  end
end
