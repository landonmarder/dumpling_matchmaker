require 'spec_helper'

feature 'user submits soup request',%q{
  As an authenticated user
  I want to make a soup request for that day
  So that I can save money on soup for lunch

  } do
  #   ACCEPTANCE CRITERIA
  # * User clicks on request a soup link from the home page
  # * Request needs to have what type of soup (dumpling or hot and sour)
  # * Request cannot be blank
  # * Request is for the day of
  # * Request has fulfilled_by that starts out as nil (user does not input this, it will be the user_id of of the current user)
  # * User gets redirected to the home page


  scenario 'with valid attributes' do
    user = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with:(user.email)
    fill_in 'Password', with:(user.password)
    click_button 'Sign In'
  end
end

