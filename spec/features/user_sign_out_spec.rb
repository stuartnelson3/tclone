require 'spec_helper'

feature 'User logs out' do
  before(:each) do
    user = FactoryGirl.create(:user)
    user.confirmed_at = Time.now
    user.save
    login_as(user, :scope => :user)
  end

  scenario 'successfully' do
    visit '/'
    click_link 'Logout'
    page.should have_css('.success', text: /signed out/i)
  end
end
