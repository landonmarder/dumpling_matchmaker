require 'spec_helper'

feature 'authenticated user signs out' do
  # ACCEPTANCE CRITERIA
  # * I am a signed in user
  # * I must click on the sign out page
  # * I must click sign out
  # * I must be returned to the home page

  let(:user) { FactoryGirl.create(:user) }

  scenario 'an exisiting user signs out' do
    visit root_path
    within(".user_email") { fill_in 'Email', with: user.email }
    fill_in 'Password', with: user.password
    click_button 'Sign In'

    expect(page).to have_content('Sign Out')
    click_link 'Sign Out'

    expect(page).to_not have_content('Sign Out')
    expect(page).to have_content('Signed out successfully.')
  end

  scenario 'a user that is not authenticated cannot sign out' do
    visit root_path
    expect(page).to_not have_content('Sign Out')
  end
end
