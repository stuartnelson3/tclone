require 'spec_helper'

describe User do
  let(:user) { User.new(user_name: "sample_user", email: "example@example.com", password: "example_password") }

  context "validations" do
    it "shouldn't allow a user_name with fewer than 3 characters" do
      user.user_name = "aa"
      expect(user.valid?).to eq(false)
    end
    it "shouldn't allow a user_name with more 20 characters" do
      user.user_name = "a" * 21
      expect(user.valid?).to eq(false)
    end
    it "shouldn't allow a user's info to exceed 140 characters" do
      user.info = "a" * 141
      expect(user.valid?).to eq(false)
    end
  end

  context "metaprogramming methods" do
    it "should respond to #tweets_count" do
      expect(user.respond_to?(:tweets_count)).to eq(true)
    end
    it "should respond to #following_count" do
      expect(user.respond_to?(:following_count)).to eq(true)
    end
    it "should respond to #followers_count" do
      expect(user.respond_to?(:followers_count)).to eq(true)
    end
  end

  context "favorites" do
    it "should respond to #favorites" do
      expect(user.respond_to?(:favorites)).to eq(true)
    end
  end
end
