require 'spec_helper'

describe Tweet do
  let(:tweet) { Tweet.new }

  context "validations" do
    it "should reject long tweets" do
      tweet.text = "a" * 141
      expect(tweet.valid?).to eq(false)
    end
  end
end
