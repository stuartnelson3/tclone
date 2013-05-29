require 'spec_helper'

feature 'User signs up' do
  scenario 'at home page' do
    visit '/'
    page.should have_css("h2", text: /Sign In/i)
    find('.sign-up #user_user_name').set 'new_user'
    find('.sign-up #user_email').set 'new_user@example.com'
    find('.sign-up #user_password').set 'example_password'
    find('.sign-up #user_password_confirmation').set 'example_password'
    click_button 'Sign up'
    page.should have_css(".success", /email confirmation/i)
  end
end
