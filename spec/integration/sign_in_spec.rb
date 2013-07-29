require 'spec_helper'
feature 'Signing in' do
  before do
    Factory(:user, :email => "user@beefan.com")
  end
  scenario 'Signing in via confirmation' do
    open_email "user@beefan.com", :with_subject => /Confirmation/
    p User.first.confirmation_token
    p current_email.bodyclick_first_link_in_email
    page.should have_content("Your account was successfully confirmed")
    page.should have_content("Signed in as user@beefan.com")
  end
  scenario 'Signing in via form' do
    User.find_by_email('user@beefan.com').confirm!
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', :with => "user@beefan.com"
    fill_in 'Password', :with => "password"
    click_button "Sign in"
    page.should have_content("Signed in successfully.")
  end
end
