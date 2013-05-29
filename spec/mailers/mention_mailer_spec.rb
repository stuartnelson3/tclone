require "spec_helper"

describe MentionMailer do
  let(:tweet) { FactoryGirl.create(:tweet) }
  let(:user) { FactoryGirl.create(:user) }
  let(:mention_mailer) { MentionMailer.mention_email(tweet, user.user_name) }

  context "email content" do
    it "should have the right subject" do
      subject = "You were mentioned by test_user!"
      expect(mention_mailer.subject).to eq(subject)
    end

    it "should be addressed to the right person" do
      expect(mention_mailer.to).to eq([user.email])
    end

    it "should be from no-reply@twabbler.com" do
      from = ["no-reply@twabbler.com"]
      expect(mention_mailer.from).to eq(from)
    end
  end

  context "sending the letter" do
    it "should send the letter" do
      expect(ActionMailer::Base.deliveries).to include(mention_mailer)
    end
  end
end
