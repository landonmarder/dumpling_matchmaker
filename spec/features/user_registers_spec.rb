require 'spec_helper'

feature 'user registers' do
  # ACCEPTANCE CRITERIA
  # * I click on sign up from the home page
  # * I have a valid email
  # * I have a valid first and last name
  # * I have a password
  # * I get redirected to home page

  scenario 'person registers successfully' do
    visit root_path
    click_link 'Sign Up'
    expect(page).to have_content('Sign Up:')
    fill_in 'First Name', with: 'Joe'
    fill_in 'Last Name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'Password123'
    fill_in 'Password Confirmation', with: 'Password123'
    click_button 'Sign Up'

    expect(page).to have_content("Signed up successfully")
    expect(page).to have_content('Sign Out')
  end

  scenario 'person tries to register unsuccessfully'
end
