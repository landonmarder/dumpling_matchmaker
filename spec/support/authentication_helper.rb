module AuthenticationHelper
  def sign_in_as(user)
    visit root_path
    click_link 'Sign In'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Sign In'

    expect(page).to have_content("Sign Out")
    expect(page).to have_content("Signed in successfully.")
    expect(page).to_not have_content("Sign In")
  end
end
