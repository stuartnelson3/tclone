require 'spec_helper'

feature 'User searches' do
  scenario 'and finds no users' do
    visit '/'
    find('.user-search').set "dfoiahfia"
    click_button('Search')
    page.should have_css('h1', text: /no users found/i)
  end

  scenario 'finds one user' do
    user = FactoryGirl.create(:user)
    visit '/'
    find('.user-search').set user.user_name
    click_button('Search')
    page.should have_css('h1', text: "#{user.user_name}'s tweets")
  end

  scenario 'finds multiple users' do
    FactoryGirl.create(:user)
    User.create(email: "test_user_2@example.com", user_name: "test_user_2", password: "password")
    visit '/'
    find('.user-search').set 'test_user'
    click_button('Search')
    page.should have_css('.user_name')
  end
end
