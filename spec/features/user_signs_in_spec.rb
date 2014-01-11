require 'spec_helper'

feature 'user signs in' do
  # ACCEPTANCE CRITERIA
  # * I click on sign in from the home page
  # * I have a valid email
  # * I have a valid first and last name
  # * I have a password
  # * I get redirected to home page
  let(:user) { FactoryGirl.create(:user) }

  scenario 'user signs in with no problems' do
    visit root_path
    within(".user_email") { fill_in 'Email', with: user.email }
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Signed in successfully.')
  end

  scenario 'user attempts to sign in blank' do
    visit root_path
    click_button 'Sign In'

    expect(page).to have_content("Invalid email or password")
  end

  scenario 'a non existent email and password is supplied and denied access' do
    visit root_path
    fill_in 'Email', with: 'nobody@example.com'
    fill_in 'Password', with: 'no_password'
    click_button 'Sign In'

    expect(page).to have_content('Invalid email or password.')
  end

  scenario 'user attemps to sign in with incorrect password and denied access' do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "not#{user.password}"
    click_button 'Sign In'

    expect(page).to have_content('Invalid email or password.')
  end
end
