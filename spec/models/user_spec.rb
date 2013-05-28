require 'spec_helper'

describe User do
  let(:user) { User.new }

  context "metaprogramming methods" do
    it "should respond to #tweets_count" do
      user.respond_to?(:tweets_count).should be_true
    end
    it "should respond to #following_count" do
      user.respond_to?(:following_count).should be_true
    end
    it "should respond to #followers_count" do
      user.respond_to?(:followers_count).should be_true
    end
  end

  context "favorites" do
    it "should respond to #favorites" do
      expect(user.respond_to?(:favorites)).to eq(true)
    end
  end
end
