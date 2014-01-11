require 'spec_helper'

feature 'user fulfills a soup request' do
# ACCEPTANCE CRITERIA
# * User clicks on fulfill a request link
# * I only see soup requests created on the current day
# * I click on button fulfill to make the fulfillment
# * When I click on the button fulfill, the match is made and the soup request is no longer displayed on the list
# * Clicking fulfill edits the request by giving the request a user_id
# * I am redirected back to the index of requests
  let(:soup_fulfiller) { FactoryGirl.create(:user) }

  scenario 'user fulfills a request' do
    ActionMailer::Base.deliveries = []
    soup_wanter = FactoryGirl.create(:user)
    soup_request = FactoryGirl.create(:request, user: soup_wanter)
    visit root_path
    within(".user_email") { fill_in 'Email', with: soup_fulfiller.email }
    fill_in 'Password', with: soup_fulfiller.password
    click_button 'Sign In'

    click_link 'Fulfill a Soup Request'
    expect(page).to have_content(soup_wanter.first_name + ' ' + soup_wanter.last_name)
    expect(page).to have_content(soup_request.soup)

    click_link 'Fulfill Request'
    expect(page).to have_content('Request Fulfilled!')
    expect(page).to_not have_content(soup_wanter.first_name + ' ' + soup_wanter.last_name)
    expect(page).to_not have_content(soup_request.soup)

    expect(ActionMailer::Base.deliveries.size).to eql(1)
    last_email = ActionMailer::Base.deliveries.last
    expect(last_email).to have_subject('Dumpling King Match Made!')
    expect(last_email).to deliver_to(soup_wanter.email, soup_fulfiller.email)
  end
end
