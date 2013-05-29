require 'spec_helper'

feature 'User signs in' do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @user.confirmed_at = Time.now
    @user.save
  end

  scenario 'at home page' do
    visit '/'
    page.should have_css("h2", text: /Sign In/i)
    find('.sign-in #user_email').set @user.email
    find('.sign-in #user_password').set 'example_password'
    click_button 'Sign in'
    page.should have_css(".success", text: /signed in/i)
  end
end
