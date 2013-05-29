require 'spec_helper'

feature 'User tweets' do
  before(:each) do
    user = FactoryGirl.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, :scope => :user)
  end

  scenario 'with a correct length tweet' do
    visit '/'
    fill_in 'tweet_text', with: "a" * 14
    page.should have_css(".create-tweet")
  end

  after(:each) do
    Warden.test_reset!
  end
end
