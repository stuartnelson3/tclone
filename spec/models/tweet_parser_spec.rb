require 'spec_helper'

describe TweetParser do
  let(:tweet_parser) { TweetParser.new("Mention @user and @another_user") }

  context "parsing a tweet" do
    it "should pull out user_names" do
      expect(tweet_parser.parse_user_names).to eq(["@user", "@another_user"])
    end

    it "should turn the username into a link" do
      anchor_text = "<a href='/user' class='mention-link'>@user</a>"
      expect(tweet_parser.make_link("@user")).to eq(anchor_text)
    end

    it "should return the text with links to the usernames" do
      parsed_tweet = "Mention <a href='/user' class='mention-link'>@user</a> and <a href='/another_user' class='mention-link'>@another_user</a>"
      expect(tweet_parser.parse).to eq(parsed_tweet)
    end
  end
end
